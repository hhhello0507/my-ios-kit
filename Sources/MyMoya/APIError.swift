import Foundation

public protocol ErrorResponse: Decodable & Equatable {}

public enum APIError<Res: ErrorResponse>: Error, Equatable {
    public static func == (lhs: APIError, rhs: APIError) -> Bool {
        switch (lhs, rhs) {
        case (.http, .http): true
        case (.httpWithResponse(let lhsRes), .httpWithResponse(let rhsRes)): lhsRes == rhsRes
        case (.unknown, .unknown): true
        case (.refreshFailure, .refreshFailure): true
        default: false
        }
    }
    
    case http
    case httpWithResponse(Res)
    case unknown
    case decodingFailure
    case refreshFailure
}

public struct EmptyErrorResponse: ErrorResponse {}
