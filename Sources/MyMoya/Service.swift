import Foundation
import Moya
import CombineMoya
import Combine

public class Service<Target: Endpoint> {
    
    private var allowLog: Bool = true
    
    func request<T: Decodable, ErrorRes: Decodable>(
        _ target: Target.Target,
        res: T.Type,
        errorRes: ErrorRes.Type = EmptyErrorResponse.self
    ) -> AnyPublisher<T, APIError<ErrorRes>> {
        typealias APIErrorWithRes = APIError<ErrorRes>
        self.requestLog(target: target)
        return Target.provider
            .requestPublisher(target)
            .filterSuccessfulStatusCodes() // 200..<300
            .tryMap { result in // map response
                let value: T
                do {
                    value = try myDecoder.decode(T.self, from: result.data)
                } catch {
                   print("❌ Decoding Error - cause: \(error)")
                   throw APIErrorWithRes.unknown
                }
                self.responeLog(target: target, response: result)
                return value
            }
            .mapError { error in // map error
                guard let error = error as? MoyaError,
                      let response = error.response else {
                    print("❌ Unknown Error")
                    return APIErrorWithRes.unknown
                }
                if case .underlying(let error, _) = error,
                   let error = error.asAFError,
                   case .requestRetryFailed(let retryError, _) = error,
                   let error = retryError as? APIErrorWithRes {
                    return error
                }
                self.responeLog(target: target, response: response)
                
                guard (errorRes as? EmptyErrorResponse.Type) == nil else {
                    return APIErrorWithRes.http
                }
                
                guard let error = try? myDecoder.decode(ErrorRes.self, from: response.data) else {
                    return APIErrorWithRes.decodingFailure
                }
                return APIErrorWithRes.httpWithResponse(error)
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    public func performRequest<T: Decodable, ErrorRes: ErrorResponse>(
        _ target: Target.Target,
        res: T.Type,
        errorRes: ErrorRes.Type = EmptyErrorResponse.self
    ) -> AnyPublisher<T, APIError<ErrorRes>> {
        request(target, res: T.self, errorRes: errorRes)
    }
    
    public func allowLog(_ allowLog: Bool) {
        self.allowLog = allowLog
    }
}

private extension Service {
    func requestLog(target: Target.Target) {
        guard allowLog else {
            return
        }
        print("🛰 NETWORK Reqeust LOG")
        print(
            "URL: \(target.host)/\(target.path)\n"
            + "Header: \(target.headers ?? [:])\n"
            + "Method: \(target.method.rawValue)"
        )
        if case .requestJSONEncodable(let req) = target.task,
           let json = try? myEncoder.encode(req) {
            print("Body: \(String(data: json, encoding: .utf8) ?? "-")")
        } else if case .requestParameters(let parameters, _) = target.task,
                  let json = try? JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted) {
            print("Body: \(String(data: json, encoding: .utf8) ?? "-")")
        } else if case .uploadMultipart(let multiParts) = target.task {
            Array(multiParts.enumerated()).forEach { idx, data in
                print("MultiPart \(idx): name - \(data.name), fileName - \(data.fileName ?? ""), mimeType - \(data.mimeType ?? "")")
            }
        }
    }
    
    func responeLog(target: Target.Target, response: Moya.Response) {
        guard allowLog else {
            return
        }
        print("🛰 NETWORK Response LOG")
        print(
            "URL: \(target.host)/\(target.path)" + "\n"
            + "StatusCode: " + "\(response.response?.statusCode ?? 0)" + "\n"
            + "Data: \(response.data.toPrettyPrintedString ?? "")"
        )
    }
}
