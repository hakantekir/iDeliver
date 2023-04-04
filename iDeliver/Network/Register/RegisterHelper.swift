//
//  RegisterHelper.swift
//  iDeliver
//
//  Created by Hakan Tekir on 30.03.2023.
//

import Foundation

enum RegisterEndpoint: String {
    case register = "api/v1/auth/register"
    
    var path: String {
        NetworkHelper.shared.requestURL(endPoint: self.rawValue)
    }
}
