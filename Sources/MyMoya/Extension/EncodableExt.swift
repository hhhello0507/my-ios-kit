import Foundation
import Moya

public extension Encodable {
    func toRequestParameters(encoding: ParameterEncoding) -> Moya.Task {
        if let data = try? JSONEncoder().encode(self),
           let object = (try? JSONSerialization.jsonObject(
            with: data,
            options: .allowFragments
           )).flatMap({ $0 as? [String: Any] }) {
            let parameters = object.mapValues { value -> Any in
                if let enumValue = value as? (any RawRepresentable) {
                    return enumValue.rawValue
                }
                return value
            }
            return .requestParameters(
                parameters: parameters,
                encoding: encoding
            )
        }
        return .requestPlain
    }
    
    func toJSONParameters() -> Moya.Task {
        toRequestParameters(encoding: JSONEncoding.default)
    }
    
    func toURLParameters() -> Moya.Task {
        toRequestParameters(encoding: URLEncoding.default)
    }
}

public extension Encodable {
    func encoded() -> String? {
        let encoder = JSONEncoder()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS"
        encoder.dateEncodingStrategy = .formatted(formatter)
        guard let data = try? encoder.encode(self) else {
            return nil
        }
        
        return String(data: data, encoding: .utf8)
    }
}
