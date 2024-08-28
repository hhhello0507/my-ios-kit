import Moya

infix operator - : AdditionPrecedence
public func - (method: Moya.Method, path: String) -> (Moya.Method, String) {
    return (method, path)
}

public func - (m: (Moya.Method, String), task: Moya.Task) -> (Moya.Method, String, Moya.Task) {
    return (m.0, m.1, task)
}
