//
//  SearchUser.swift
//  carrefour
//
//  Created by Pedro Sousa on 30/06/23.
//

import Foundation

struct SearchUser: Codable {

  var totalCount        : Int?     = nil
  var incompleteResults : Bool?    = nil
  var items             : [User]? = []

  enum CodingKeys: String, CodingKey {

    case totalCount        = "total_count"
    case incompleteResults = "incomplete_results"
    case items             = "items"
  
  }
}
