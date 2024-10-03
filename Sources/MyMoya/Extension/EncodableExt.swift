import Foundation
import Moya
import MyFoundationUtil

public extension Encodable {
    func toRequestParameters(encoding: ParameterEncoding, using encoder: JSONEncoder) -> Moya.Task {
        if let data = try? encoder.encode(self),
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
    
    func toJSONParameters(using encoder: JSONEncoder = .myEncoder) -> Moya.Task {
        toRequestParameters(encoding: JSONEncoding.default, using: encoder)
    }
    
    func toURLParameters(using encoder: JSONEncoder = .myEncoder) -> Moya.Task {
        toRequestParameters(encoding: URLEncoding.default, using: encoder)
    }
}
