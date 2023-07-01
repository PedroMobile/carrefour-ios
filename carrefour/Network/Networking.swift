//
//  Networking.swift
//  carrefour
//
//  Created by Pedro Sousa on 28/06/23.
//

import Foundation

public struct Networking {
    public enum Environment: String { case prd, stg, dev }
    public static var environment: Environment = .dev
    
    public enum Method: String {
        case post = "POST", get = "GET", patch = "PATCH", put = "PUT", delete = "DELETE"
    }
    
    public init() {}
}
