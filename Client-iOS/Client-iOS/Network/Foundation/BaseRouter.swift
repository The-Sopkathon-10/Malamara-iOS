//
//  BaseRouter.swift
//  Client-iOS
//
//  Created by 김수연 on 2022/05/21.
//

import Foundation
import Alamofire

/*
 BaseRouter : URLRequestConvertible을 채택한 프로토콜, 실제 각 Endpont에 해당하는 Router들이
 BaseRouter를 채택하여 request 과정을 모듈화.
 */

protocol BaseRouter: URLRequestConvertible {
    var baseURL: String { get }
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: RequestParams { get }
    var header: HeaderType { get }
}

extension BaseRouter {
    var baseURL: String {
        return APIEnvironment.development.baseUrl
    }

    // URLRequestConvertible 구현
    func asURLRequest() throws -> URLRequest {
        let url = try baseURL.asURL()
        var urlRequest = try URLRequest(url: url.appendingPathComponent(path), method: method)

        urlRequest = self.makeHeaderForRequest(to: urlRequest)

        return try self.makeParameterForRequest(to: urlRequest, with: url)
    }

    private func makeHeaderForRequest(to request: URLRequest) -> URLRequest {
        var request = request

        switch header {
        case .basic:
            request.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)

        case .auth:
            request.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
            request.setValue(ContentType.tokenSerial.rawValue, forHTTPHeaderField: HTTPHeaderField.accesstoken.rawValue)

        case .multiPart:
            request.setValue(ContentType.multiPart.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)

        case .multiPartWithAuth:
            request.setValue(ContentType.multiPart.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
            request.setValue(ContentType.tokenSerial.rawValue, forHTTPHeaderField: HTTPHeaderField.accesstoken.rawValue)
        }

        return request
    }

    private func makeParameterForRequest(to request: URLRequest, with url: URL) throws -> URLRequest {
        var request = request

        switch parameters {
        case .query(let query):
            let params = query?.toDictionary() ?? [:]
            let queryParams = params.map { URLQueryItem(name: $0.key, value: "\($0.value)") }
            var components = URLComponents(string: url.appendingPathComponent(path).absoluteString)
            components?.queryItems = queryParams
            request.url = components?.url

        case .body(let body):
            let params = body?.toDictionary() ?? [:]
            request.httpBody = try JSONSerialization.data(withJSONObject: params, options: [])

        case .requestParameters(let requestParams):
            let params = requestParams
            request.httpBody = try JSONSerialization.data(withJSONObject: params, options: [])
        }

        return request
    }
}

enum RequestParams {
    case query(_ parameter: Codable?)
    case body(_ parameter: Codable?)
    case requestParameters(_ parameter: [String : Any])
}

extension Encodable {
    func toDictionary() -> [String: Any] {
        guard let data = try? JSONEncoder().encode(self),
              let jsonData = try? JSONSerialization.jsonObject(with: data),
              let dictionaryData = jsonData as? [String: Any] else { return [:] }
        return dictionaryData
    }
}

