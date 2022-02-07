//
//  NetworkProvider.swift
//  Networking
//
//  Created by Wesley Brito Bernardes on 05/02/22.
//

import Alamofire

public protocol RequestInfoConvertible {
    func asRequestInfo() -> NetworkProvider
}

public struct NetworkProvider {
    var url: URLConvertible
    var method: HTTPMethod
    var parameters: Parameters?
    var encoding: ParameterEncoding
    var headers: HTTPHeaders?
    var interceptor: RequestInterceptor?
    var requestModifier: Session.RequestModifier?

    public init(url: URLConvertible,
         method: HTTPMethod = .get,
         parameters: Parameters? = nil,
         encoding: ParameterEncoding = URLEncoding.default,
         headers: HTTPHeaders? = nil,
         interceptor: RequestInterceptor? = nil,
         requestModifier: Session.RequestModifier? = nil) {
        self.url = url
        self.method = method
        self.parameters = parameters
        self.encoding = encoding
        self.headers = headers
        self.interceptor = interceptor
        self.requestModifier = requestModifier
    }
}
