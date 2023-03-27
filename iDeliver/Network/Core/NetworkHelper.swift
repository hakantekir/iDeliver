//
//  NetworkHelper.swift
//  iDeliver
//
//  Created by Hakan Tekir on 9.02.2023.
//

import Foundation

enum HTTPMethods: String {
    case get = "GET"
    case post = "POST"
}

enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case parseError
    case unknownError(Error)
    case apiError(APIError)
}

struct APIError: Decodable {
    let code: Int
    let reason: String
    let message: String
}

class NetworkHelper {
    static let shared = NetworkHelper()
    
    private let baseURL = "http://192.168.1.173/"
    
    func requestURL(endPoint: String) -> String {
        baseURL + endPoint
    }
}
