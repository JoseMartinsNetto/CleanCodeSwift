//
//  Repository.swift
//  Generics Demo
//
//  Created by Jose Martins on 24/03/21.
//

import Foundation

struct Repository: Codable {
    var id: Int
    var nodeId: String
    var name: String
    var fullName: String
    var isPrivate: Bool
    var owner: User
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case nodeId = "node_id"
        case name = "name"
        case fullName = "full_name"
        case isPrivate = "private"
        case owner = "owner"
    }
}
