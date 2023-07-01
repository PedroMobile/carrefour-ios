//
//  ServiceURL+MicroServices.swift
//  carrefour
//
//  Created by Pedro Sousa on 28/06/23.
//

import Foundation

struct ServiceURL {
    
    struct MicroServices {
        
        static var domain: String {
            switch Networking.environment {
            case .prd: return "https://api.github.com/"
            case .stg: return "https://api.github.com/"
            case .dev: return "https://api.github.com/"
            }
        }
    }
}

extension ServiceURL.MicroServices {
    
    struct User {
        static var page: String { "\(domain)users" }
        enum Endpoint {
            var url: URL { URL(string: "\(page)\(rawValue)")! }
            case fetchUsers
            case fetchUser(login: String)
            case fetchRepos(login: String)
            
            var rawValue: String {
                switch self {
                case .fetchUsers:
                    return ""
                    
                case .fetchUser(let login):
                    return "/\(login)"
                    
                case .fetchRepos(let login):
                    return "/\(login)/repos"
                }
            }
        }
    }
    
    struct Search {
        static var page: String { "\(domain)search" }
        enum Endpoint {
            var url: URL { URL(string: "\(page)\(rawValue)")! }
            case searchUser(login: String)
            
            var rawValue: String {
                switch self {
                    
                case .searchUser(let login):
                    return "/users?q=\(login)"
                    
                }
            }
        }
    }
}
