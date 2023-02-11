//
//  NetworkManager.swift
//  iDeliver
//
//  Created by Hakan Tekir on 9.02.2023.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    
    func request<T: Codable>(type: T.Type,
                             url: String,
                             method: HTTPMethods,
                             completion: @escaping((Result<T, ErrorTypes>) -> Void)) {
        guard let url = URL(string: url) else {
            completion(.failure(.invalidURL))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")

        let dataTask = URLSession.shared.dataTask(with: request) { data, response, error in
            if let _ = error {
                completion(.failure(.generalError))
            } else {
                guard let data = data else {
                    completion(.failure(.invalidData))
                    return
                }
                self.handleResponse(data: data) { response in
                    completion(response)
                }
            }
        }
        
        dataTask.resume()
    }
    
    fileprivate func handleResponse<T: Codable>(data: Data, completion: @escaping((Result<T, ErrorTypes>) -> Void )) {
        do {
            let result = try JSONDecoder().decode(T.self, from: data)
            completion(.success(result))
        } catch {
            completion(.failure(.parseError))
        }
    }
}
