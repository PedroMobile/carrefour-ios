//
//  NetworkingClient+MicroServices.swift
//  carrefour
//
//  Created by Pedro Sousa on 28/06/23.
//

import Foundation
import Alamofire

final class Service {
    
    // MARK: - Singleton
    static let shared = Service()
    
    // MARK: - URL
    fileprivate typealias UserEndpoint = ServiceURL.MicroServices.User.Endpoint
    fileprivate typealias SearchUserEndpoint = ServiceURL.MicroServices.Search.Endpoint
    
    // MARK: - Services
    func fetchUsers(completion: @escaping ([User]?, Error?) -> ()) {
        let url = UserEndpoint.fetchUsers.url
        AF.request(url).responseDecodable(of: [User].self) { response in
            switch response.result {
            case .success:
                completion(response.value, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }
    
    func fetchUser(login: String, completion: @escaping (UserInfo?, Error?) -> ()) {
        let url = UserEndpoint.fetchUser(login: login).url
        AF.request(url).responseDecodable(of: UserInfo.self) { response in
            switch response.result {
            case .success:
                completion(response.value, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }
    
    func fetchRepos(login: String, completion: @escaping ([Repo]?, Error?) -> ()) {
        let url = UserEndpoint.fetchRepos(login: login).url
        AF.request(url).responseDecodable(of: [Repo].self) { response in
            switch response.result {
            case .success:
                completion(response.value, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }
    
    func searchUser(login: String, completion: @escaping ([User]?, Error?) -> ()) {
        let url = SearchUserEndpoint.searchUser(login: login).url
        AF.request(url).responseDecodable(of: SearchUser.self) { response in
            switch response.result {
            case .success:
                completion(response.value?.items, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }
    
}
