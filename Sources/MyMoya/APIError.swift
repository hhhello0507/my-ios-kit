import Foundation

public enum APIError: Error, Equatable {
    case http
    case unknown
    case refreshFailure
}
