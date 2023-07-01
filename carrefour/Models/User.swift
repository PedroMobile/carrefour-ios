//
//  User.swift
//  carrefour
//
//  Created by Pedro Sousa on 28/06/23.
//

import Foundation

struct User: Codable {

  var login             : String? = nil
  var id                : Int?    = nil
  var nodeId            : String? = nil
  var avatarUrl         : String? = nil

  enum CodingKeys: String, CodingKey {

    case login             = "login"
    case id                = "id"
    case nodeId            = "node_id"
    case avatarUrl         = "avatar_url"
  
  }

}
