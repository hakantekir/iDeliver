//
//  RegisterManager.swift
//  iDeliver
//
//  Created by Hakan Tekir on 30.03.2023.
//

import Foundation

protocol RegisterManagerProtocol {
    func registerRequest(user: User, completion: @escaping ((Result<User, APIError>) -> Void))
}

class RegisterManager: RegisterManagerProtocol {
    static let shared = RegisterManager()
    
    func registerRequest(user: User, completion: @escaping ((Result<User, APIError>) -> Void)){
        guard let body = try? JSONEncoder().encode(user) else {
            return
        }
        
        NetworkManager.shared.request(responseType: User.self,
                                      url: RegisterEndpoint.register.path,
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
