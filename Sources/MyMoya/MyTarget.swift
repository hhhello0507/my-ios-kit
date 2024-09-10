import Moya
import Foundation

public protocol MyTarget: TargetType {
    var baseUrlString: String { get }
    var host: String { get }
    var route: Route { get }
    static var provider: MoyaProvider<Self> { get }
}

public extension MyTarget {
    static var session: Session {
        Session()
    }
    
    var baseURL: URL {
        URL(string: baseUrlString)!
            .appendingPathComponent(host)
    }
    
    var path: String {
        route.path
    }
    
    var method: Moya.Method {
        route.method
    }
    
    var task: Moya.Task {
        route.task
    }
    
    var headers: [String: String]? {
        ["Content-type": "application/json"]
    }
    
    var validationType: ValidationType {
        .successCodes
    }
}
