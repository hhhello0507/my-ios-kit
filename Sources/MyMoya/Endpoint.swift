import Moya
import Foundation

public protocol Endpoint: TargetType {
    associatedtype Target: Endpoint
    var baseUrlString: String { get }
    var host: String { get }
    var route: (Moya.Method, String, Moya.Task) { get }
    static var provider: MoyaProvider<Target> { get }
}

public extension Endpoint {
    static var session: Session {
        Session()
    }
    var baseURL: URL {
        return URL(string: baseUrlString)!
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
}

infix operator - : AdditionPrecedence
func - (method: Moya.Method, path: String) -> (Moya.Method, String) {
    return (method, path)
}

func - (m: (Moya.Method, String), task: Moya.Task) -> (Moya.Method, String, Moya.Task) {
    return (m.0, m.1, task)
}
