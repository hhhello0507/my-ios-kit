import Foundation

public protocol ErrorResponse: Decodable {}

public enum APIError<Res: ErrorResponse>: Error {
    case http
    case httpWithResponse(Res)
    case unknown
    case decodingFailure
    case refreshFailure
}

public struct EmptyErrorResponse: ErrorResponse {}
