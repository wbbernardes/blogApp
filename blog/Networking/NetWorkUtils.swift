//
//  NetWorkUtils.swift
//  Networking
//
//  Created by Wesley Brito Bernardes on 05/02/22.
//

import Combine
import Foundation

public enum NetworkError: Error {
    case invalidResponse
    case parseError
    case other(Error)
}

extension AnyPublisher where Output == Data, Failure == Error {
    public func decode<T: Decodable>(jsonDecoder: JSONDecoder = JSONDecoder()) -> AnyPublisher<T, Failure> {
        tryMap { data -> T in
            do {
                return try jsonDecoder.decode(T.self, from: data)
            } catch {
                debugPrint(NetworkError.parseError)
                throw NetworkError.parseError
            }
        }.eraseToAnyPublisher()
    }
}
