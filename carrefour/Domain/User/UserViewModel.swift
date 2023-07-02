//
//  UserViewModel.swift
//  carrefour
//
//  Created by Pedro Sousa on 30/06/23.
//

import Foundation
import UIKit

protocol UserViewModelProtocol {
    var username: String { get }
    var showLoading: (() -> ())? { get set }
    var hideLoading: (() -> ())? { get set }
    var showMessage: ((String) -> ())? { get set }
    var bindUserName: ((String) -> ())? { get set }
    var bindUserImage: ((URL) -> ())? { get set }
    var bindUserParams: (() -> ())? { get set }
    func fetchUser()
    func goToReposPage()
}

final class UserViewModel: NSObject, UserViewModelProtocol {
    
    private var service = Service.shared
    weak var coordinator: AppCoordinator?
    var username: String
    var showLoading: (() -> ())?
    var hideLoading: (() -> ())?
    var showMessage: ((String) -> ())?
    var bindUserName: ((String) -> ())?
    var bindUserImage: ((URL) -> ())?
    var bindUserParams: (() -> ())?
    
    private var user:UserInfo? {
        didSet {
            if let username = user?.login {
                bindUserName?(username)
            }
            
            if let urlString = user?.avatarUrl, let imageURL = URL(string: urlString) { bindUserImage?(imageURL)
            }
        }
    }
    
    private var params:[UserParam]? {
        didSet {
            bindUserParams?()
        }
    }
    
    init(username: String) {
        self.username = username
    }
    
    func fetchUser() {
        self.showLoading?()
        service.fetchUser(login: username) {[weak self] user, error in
            self?.hideLoading?()
            if let error = error {
                self?.showMessage?(error.localizedDescription)
                return
            }
            if let user = user {
                self?.user = user
                self?.params = self?.getParams(user)
            }
        }
    }
    
    private func getParams(_ user: UserInfo) -> [UserParam] {
        var params:[UserParam] = []
        
        addParam(key: "bio", value: user.bio)
        addParam(key: "blog", value: user.blog)
        addParam(key: "company", value: user.company)
        addParam(key: "createdAt", value: user.createdAt)
        addParam(key: "email", value: user.email)
        addParam(key: "location", value: user.location)
        addParam(key: "twitterUsername", value: user.twitterUsername)
        
        func addParam(key: String, value: String?) {
            if let value = value {
                params.append(UserParam(key: key, value: value))
            }
        }
        
        return params
    }
    
    func goToReposPage() {
        coordinator?.goToReposPage(username: username)
    }
    
}

extension UserViewModel: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return params?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(AppTableViewCell.self)", for: indexPath) as? AppTableViewCell
        if let param = params?[indexPath.row] {
            cell?.setupCell(label: param.key, value: param.value)
        }
        
        return cell ?? UITableViewCell()
    }
    
}
