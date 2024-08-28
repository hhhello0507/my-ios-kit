import Moya
import Foundation

public protocol Endpoint: TargetType {
    associatedtype Target: Endpoint
    var host: String { get }
    var route: (Moya.Method, String, Moya.Task) { get }
    var authorization: Authorization { get }
    static var provider: MoyaProvider<Target> { get }
//    static var authProvider: MoyaProvider<Target> { get }
}

public enum Authorization {
//    case authorization
    case none
}

public extension Endpoint {
    static var session: Session {
        Session()
    }
    var baseURL: URL {
//        let baseUrl = Bundle.main.object(forInfoDictionaryKey: "BaseUrl") as? String ?? ""
//        let baseUrl = "http://10.80.161.179:1234"
        return URL(string: baseUrl)!
            .appendingPathComponent(host)
    }
    
    var path: String {
        route.1
    }
    
    var method: Moya.Method {
        route.0
    }
    
    var task: Moya.Task {
        route.2
    }
    
    var headers: [String: String]? {
        ["Content-type": "application/json"]
    }
    
    var validationType: ValidationType {
        .successCodes
    }
    
    var authorization: Authorization {
//        .authorization
        .none
    }
}

infix operator - : AdditionPrecedence
func - (method: Moya.Method, path: String) -> (Moya.Method, String) {
    return (method, path)
}

func - (m: (Moya.Method, String), task: Moya.Task) -> (Moya.Method, String, Moya.Task) {
    return (m.0, m.1, task)
}
