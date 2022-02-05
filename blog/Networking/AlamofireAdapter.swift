//
//  AlamofireAdapter.swift
//  Networking
//
//  Created by Wesley Brito Bernardes on 05/02/22.
//

import Alamofire
import Combine
import Foundation

public protocol AlamofireProvider {
    func request(_ info: RequestInfoConvertible) -> AnyPublisher<Data, Error>
}

public class AlamofireAdapter: AlamofireProvider {
    public static let instance = AlamofireAdapter()

    private let session: Session

    private init() {
        session = Session.default
    }

    public func request(_ info: RequestInfoConvertible) -> AnyPublisher<Data, Error> {
        let requestInfo = info.asRequestInfo()

        return session.request(requestInfo.url, method: requestInfo.method, parameters: requestInfo.parameters, encoding: requestInfo.encoding, headers: requestInfo.headers, interceptor: requestInfo.interceptor, requestModifier: requestInfo.requestModifier).publishData().tryMap { response -> Data in
                switch response.result {
                case .success(let data):
                    return data
                case .failure(let error):
                    throw error
                }
        }
        .eraseToAnyPublisher()
    }
}
