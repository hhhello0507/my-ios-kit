import Foundation
import Moya
import CombineMoya
import Combine

public protocol NetRunner {
    associatedtype _MyTarget: MyTarget
    var allowLog: Bool { get }
    func request<DTO: Decodable, ErrorRes: Decodable>(
        _ target: _MyTarget,
        res: DTO.Type,
        errorRes: ErrorRes.Type
    ) -> AnyPublisher<DTO, APIError<ErrorRes>>
    
    func performRequest<DTO: Decodable, ErrorRes: ErrorResponse>(
        _ target: _MyTarget,
        res: DTO.Type,
        errorRes: ErrorRes.Type
    ) -> AnyPublisher<DTO, APIError<ErrorRes>>
}

public struct DefaultNetRunner<_MyTarget: MyTarget>: NetRunner {
    public typealias _MyTarget = _MyTarget
    public let allowLog: Bool
    
    public init(allowLog: Bool = true) {
        self.allowLog = allowLog
    }
    
    public func request<T: Decodable, ErrorRes: Decodable>(
        _ target: _MyTarget,
        res: T.Type,
        errorRes: ErrorRes.Type = EmptyErrorResponse.self
    ) -> AnyPublisher<T, APIError<ErrorRes>> {
        typealias APIErrorWithRes = APIError<ErrorRes>
        self.requestLog(target: target)
        return MoyaProvider<_MyTarget>()
            .requestPublisher(target)
            .filterSuccessfulStatusCodes() // 200..<300
            .tryMap { (result: Moya.Response) throws -> T in // map response
                let value: T
                do {
                    value = try myDecoder.decode(T.self, from: result.data)
                } catch {
                    if allowLog {
                        print("❌ Decoding Error - cause: \(error)")
                    }
                   throw APIErrorWithRes.unknown
                }
                self.responeLog(target: target, response: result)
                return value
            }
            .mapError { (error: Error) -> APIErrorWithRes in // map error
                guard let error = error as? MoyaError,
                      let response = error.response else {
                    if allowLog {
                        print("❌ Unknown Error")
                    }
                    return .unknown
                }
                if case .underlying(let error, _) = error,
                   let error = error.asAFError,
                   case .requestRetryFailed(let retryError, _) = error,
                   let error = retryError as? APIErrorWithRes {
                    return error
                }
                self.responeLog(target: target, response: response)
                
                guard (errorRes as? EmptyErrorResponse.Type) == nil else {
                    return .http
                }
                
                guard let error = try? myDecoder.decode(ErrorRes.self, from: response.data) else {
                    return .decodingFailure
                }
                return .httpWithResponse(error)
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    public func performRequest<T: Decodable, ErrorRes: ErrorResponse>(
        _ target: _MyTarget,
        res: T.Type,
        errorRes: ErrorRes.Type = EmptyErrorResponse.self
    ) -> AnyPublisher<T, APIError<ErrorRes>> {
        request(target, res: T.self, errorRes: errorRes)
    }
}

// MARK: - Log
private extension NetRunner {
    func requestLog(target: _MyTarget) {
        guard allowLog else { return }
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
    
    func responeLog(target: _MyTarget, response: Moya.Response) {
        guard allowLog else { return }
        print("🛰 NETWORK Response LOG")
        print(
            "URL: \(target.host)/\(target.path)" + "\n"
            + "StatusCode: " + "\(response.response?.statusCode ?? 0)" + "\n"
            + "Data: \(response.data.toPrettyPrintedString ?? "")"
        )
    }
}

private extension Data {
    var toPrettyPrintedString: String? {
        guard let object = try? JSONSerialization.jsonObject(with: self, options: []),
              let data = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted]),
              let prettyPrintedString = NSString(data: data, encoding: String.Encoding.utf8.rawValue) else { return nil }
        return prettyPrintedString as String
    }
}
