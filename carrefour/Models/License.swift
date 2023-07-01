//
//  License.swift
//  carrefour
//
//  Created by Pedro Sousa on 28/06/23.
//

import Foundation

struct License: Codable {

  var key    : String? = nil
  var name   : String? = nil
  var spdxId : String? = nil
  var url    : String? = nil
  var nodeId : String? = nil

  enum CodingKeys: String, CodingKey {

    case key    = "key"
    case name   = "name"
    case spdxId = "spdx_id"
    case url    = "url"
    case nodeId = "node_id"
  
  }

}
