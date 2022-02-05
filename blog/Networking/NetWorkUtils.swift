//
//  NetWorkUtils.swift
//  Networking
//
//  Created by Wesley Brito Bernardes on 05/02/22.
//

import Combine
import Foundation

enum NetworkError: Error {
    case parseError
    case other(Error)
}

extension AnyPublisher where Output == Data, Failure == Error {
    func decode<T: Decodable>(jsonDecoder: JSONDecoder = JSONDecoder()) -> AnyPublisher<T, Failure> {
        tryMap { data -> T in
            do {
                return try jsonDecoder.decode(T.self, from: data)
            } catch {
                throw NetworkError.parseError
            }
        }.eraseToAnyPublisher()
    }
}
