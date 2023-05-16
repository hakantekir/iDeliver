//
//  User.swift
//  iDeliver
//
//  Created by Hakan Tekir on 31.03.2023.
//

import Foundation

struct User: Codable {
    var token: String?
    var name: String?
    var surname:String?
    var email: String?
    var phone:String?
    var password: String?
}
