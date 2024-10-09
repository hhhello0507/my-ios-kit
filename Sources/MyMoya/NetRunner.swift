import Foundation
import Moya
import CombineMoya
import Combine
import MyFoundationUtil

/// NetRunner
/// NetRunner가 deinit 되면 provider도 deinit됨.
/// provider가 deinit되면 request가 cancel됨.
public protocol NetRunner {
    var provider: MoyaProvider<AnyTarget> { get }
    var authProvider: MoyaProvider<AnyTarget> { get }
    
    func deepDive<DTO: Decodable>(
        _ target: MyTarget,
        res: DTO.Type,
        completion: @escaping (Result<DTO, MoyaError>) -> Void
    )
    
    func deepDive<DTO: Decodable>(
        _ target: MyTarget,
        res: DTO.Type
    ) -> AnyPublisher<DTO, MoyaError>
    
    func deepDive<DTO: Decodable>(
        _ target: MyTarget,
        res: DTO.Type
    ) -> AnyPublisher<Result<DTO, MoyaError>, Never>
    
    func deepDive<DTO: Decodable>(
        _ target: MyTarget,
        res: DTO.Type
    ) async -> Result<DTO, MoyaError>
    
    func deepDive<DTO: Decodable>(
        _ target: MyTarget,
        res: DTO.Type
    ) async throws -> DTO
}

public class DefaultNetRunner: NetRunner {
    public let provider: MoyaProvider<AnyTarget>
    public let authProvider: MoyaProvider<AnyTarget>
    public let decoder: JSONDecoder
    
    public init(
        provider: MoyaProvider<AnyTarget> = .init(),
        authProvider: MoyaProvider<AnyTarget> = .init(),
        decoder: JSONDecoder = .myDecoder
    ) {
        self.provider = provider
        self.authProvider = authProvider
        self.decoder = decoder
    }
    
    private func selectProvider(_ target: MyTarget) -> MoyaProvider<AnyTarget> {
        switch target.authorization {
        case .none:
            provider
        case .refresh:
            authProvider
        }
    }
    
    public func deepDive<DTO>(
        _ target: MyTarget,
        res: DTO.Type,
        completion: @escaping (Result<DTO, Moya.MoyaError>) -> Void
    ) where DTO : Decodable {
        selectProvider(target).request(AnyTarget(target)) { result in
            switch result {
            case .success(let response):
                let response = self.unwrapThrowable {
                    try response.filterSuccessfulStatusCodes()
                        .map(res, using: self.decoder)
                }
                completion(response)
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    public func deepDive<DTO: Decodable>(
        _ target: MyTarget,
        res: DTO.Type
    ) -> AnyPublisher<DTO, MoyaError> {
        return selectProvider(target)
            .requestPublisher(AnyTarget(target))
            .filterSuccessfulStatusCodes() // 200..<300
            .map(DTO.self, using: decoder)
            .eraseToAnyPublisher()
    }
    
    public func deepDive<DTO>(
        _ target: MyTarget,
        res: DTO.Type
    ) -> AnyPublisher<Result<DTO, Moya.MoyaError>, Never> where DTO : Decodable {
        return selectProvider(target)
            .requestPublisher(AnyTarget(target))
            .filterSuccessfulStatusCodes()
            .map(DTO.self, using: decoder)
            .map {  Result.success($0) }
            .catch { Just(Result.failure($0)) }
            .eraseToAnyPublisher()
    }
    
    public func deepDive<DTO>(
        _ target: MyTarget,
        res: DTO.Type
    ) async -> Result<DTO, MoyaError> where DTO : Decodable {
        return await selectProvider(target)
            .request(AnyTarget(target))
            .flatMap { response in
                unwrapThrowable {
                    try response
                        .filterSuccessfulStatusCodes()
                        .map(res, using: self.decoder)
                }
            }
    }
    
    public func deepDive<DTO>(
        _ target: MyTarget,
        res: DTO.Type
    ) async throws -> DTO where DTO : Decodable {
        return try await selectProvider(target)
            .request(AnyTarget(target))
            .filterSuccessfulStatusCodes()
            .map(res, using: decoder)
    }
    
    private func unwrapThrowable<T>(
        throwable: @escaping () throws -> T
    ) -> Result<T, MoyaError> {
        do {
            return .success(try throwable())
        } catch {
            if let moyaError = error as? MoyaError {
                return .failure(moyaError)
            } else {
                return .failure(.underlying(error, nil))
            }
        }
    }
}
