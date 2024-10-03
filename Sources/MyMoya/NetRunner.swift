import Foundation
import Moya
import CombineMoya
import Combine

/// NetRunner
/// NetRunner가 deinit 되면 provider도 deinit됨.
/// provider가 deinit되면 request가 cancel됨.
public protocol NetRunner {
    associatedtype Target: MyTarget
    
    var provider: MoyaProvider<Target> { get }
    
    func deepDive<DTO: Decodable>(
        _ target: Target,
        res: DTO.Type,
        using decoder: JSONDecoder,
        completion: @escaping (Result<DTO, MoyaError>) -> Void
    )
    
    func deepDive<DTO: Decodable>(
        _ target: Target,
        res: DTO.Type,
        using decoder: JSONDecoder
    ) -> AnyPublisher<DTO, MoyaError>
    
    func deepDive<DTO: Decodable>(
        _ target: Target,
        res: DTO.Type,
        using decoder: JSONDecoder
    ) -> AnyPublisher<Result<DTO, MoyaError>, Never>
    
    func deepDive<DTO: Decodable>(
        _ target: Target,
        res: DTO.Type,
        using decoder: JSONDecoder
    ) async -> Result<DTO, MoyaError>
    
    func deepDive<DTO: Decodable>(
        _ target: Target,
        res: DTO.Type,
        using decoder: JSONDecoder
    ) async throws -> DTO
}

public class DefaultNetRunner<Target: MyTarget>: NetRunner {
    
    public typealias _MyTarget = Target
    
    public let provider: MoyaProvider<Target>
    
    public init(
        provider: MoyaProvider<Target> = .init()
    ) {
        self.provider = provider
    }
    
    public func deepDive<DTO>(
        _ target: Target,
        res: DTO.Type,
        using decoder: JSONDecoder,
        completion: @escaping (Result<DTO, Moya.MoyaError>) -> Void
    ) where DTO : Decodable {
        provider.request(target) { result in
            switch result {
            case .success(let response):
                let response = self.unwrapThrowable {
                    try response.filterSuccessfulStatusCodes()
                        .map(res, using: decoder)
                }
                completion(response)
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    public func deepDive<DTO: Decodable>(
        _ target: _MyTarget,
        res: DTO.Type,
        using decoder: JSONDecoder = .myDecoder
    ) -> AnyPublisher<DTO, MoyaError> {
        return provider
            .requestPublisher(target)
            .filterSuccessfulStatusCodes() // 200..<300
            .map(DTO.self, using: decoder)
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    public func deepDive<DTO>(
        _ target: Target,
        res: DTO.Type,
        using decoder: JSONDecoder
    ) -> AnyPublisher<Result<DTO, Moya.MoyaError>, Never> where DTO : Decodable {
        return provider
            .requestPublisher(target)
            .filterSuccessfulStatusCodes()
            .map(DTO.self, using: decoder)
            .map {  Result.success($0) }
            .catch { Just(Result.failure($0)) }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    public func deepDive<DTO>(
        _ target: Target,
        res: DTO.Type,
        using decoder: JSONDecoder
    ) async -> Result<DTO, MoyaError> where DTO : Decodable {
        return await provider
            .request(target)
            .flatMap { response in
                unwrapThrowable {
                    try response
                        .filterSuccessfulStatusCodes()
                        .map(res, using: decoder)
                }
            }
    }
    
    public func deepDive<DTO>(
        _ target: Target,
        res: DTO.Type,
        using decoder: JSONDecoder
    ) async throws -> DTO where DTO : Decodable {
        return try await provider
            .request(target)
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
