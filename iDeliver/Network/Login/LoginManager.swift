//
//  LoginManager.swift
//  iDeliver
//
//  Created by Hakan Tekir on 3.04.2023.
//

import Foundation

protocol LoginManagerProtocol {
    func loginRequest(user: User, completion: @escaping ((Result<User, APIError>) -> Void))
}

class LoginManager: LoginManagerProtocol {
    static let shared = LoginManager()
    
    func loginRequest(user: User, completion: @escaping ((Result<User, APIError>) -> Void)){
        guard let body = try? JSONEncoder().encode(user) else {
            return
        }
        
        NetworkManager.shared.request(responseType: User.self,
                                      url: LoginEndpoint.login.path,
                                      httpMethod: .post,
                                      body: body) { response in
            switch (response) {
            case .success(let result):
                completion(.success(result))
            case .failure(let error):
                switch (error) {
                case .apiError(let apiError):
                    completion(.failure(apiError))
                default:
                    let apiError = APIError(statusCode: 0, reason: "Connection Error", message: "Please check your internet connection!")
                    completion(.failure(apiError))
                }
            }
        }
    }
}
