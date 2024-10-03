import Moya
import Foundation

/// MyTarget
/// Moya.TargetType을 추상화한 protocol
public protocol MyTarget: TargetType {
    var baseUrlString: String { get }
    var host: String { get }
    var route: Route { get }
}

public extension MyTarget {
    var baseURL: URL {
        URL(string: baseUrlString)!
            .appendingPathComponent(host)
    }
    
    /**
     Devide route
     */
    var path: String {
        route.path
    }
    var method: Moya.Method {
        route.method
    }
    var task: Moya.Task {
        route.task
    }
    
    /**
     Just default value.
     You can change another value.
     */
    var headers: [String: String]? {
        ["Content-type": "application/json"]
    }
    var validationType: ValidationType {
        .successCodes
    }
}
