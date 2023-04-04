//
//  LoginHelper.swift
//  iDeliver
//
//  Created by Hakan Tekir on 3.04.2023.
//

import Foundation

enum LoginEndpoint: String {
    case login = "api/v1/auth/login"
    case verify = "api/v1/auth/verify"
    case forgotPassword = "api/v1/auth/forgot"
    
    var path: String {
        NetworkHelper.shared.requestURL(endPoint: self.rawValue)
    }
}
