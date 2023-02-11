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

enum ErrorTypes: Error {
    case invalidURL
    case invalidData
    case parseError
    case generalError
}

class NetworkHelper {
    static let shared = NetworkHelper()
    
    private let baseURL = "http://192.168.1.173/"
    
    func requestURL(endPoint: String) -> String {
        baseURL + endPoint
    }
}
