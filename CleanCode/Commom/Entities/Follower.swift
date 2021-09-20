//
//  Follower.swift
//  Generics Demo
//
//  Created by Jose Martins on 22/03/21.
//

import Foundation

struct Follower: Codable {
    var userName: String
    
    enum CodingKeys: String, CodingKey {
        case userName = "login"
    }
}
