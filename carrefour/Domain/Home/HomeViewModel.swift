//
//  HomeViewModel.swift
//  carrefour
//
//  Created by Pedro Sousa on 28/06/23.
//

import Foundation
import UIKit

protocol HomeViewModelProtocol {
    var showLoading: (() -> ())? { get set }
    var hideLoading: (() -> ())? { get set }
    var showMessage: ((String) -> ())? { get set }
    var bindUsers: (([User]) -> ())? { get set }
    
    func fetchUsers()
    func searchUser(login:String)
    var users:[User]? { get }
    func goToUserPage(row: Int)
}

final class HomeViewModel: NSObject, HomeViewModelProtocol {
    
    private var service = Service.shared
    weak var coordinator : AppCoordinator?
    
    var showLoading: (() -> ())?
    var hideLoading: (() -> ())?
    var showMessage: ((String) -> ())?
    var bindUsers: (([User]) -> ())?
    
    var users:[User]? {
        didSet {
            if let users = users {
                bindUsers?(users)
            }
        }
    }
    
    func fetchUsers() {
        self.showLoading?()
        service.fetchUsers {[weak self] users, error in
            self?.hideLoading?()
            if let error = error {
                self?.showMessage?(error.localizedDescription)
                return
            }
            if let users = users {
                self?.users = users
            }
        }
    }
    
    func searchUser(login:String) {
        self.showLoading?()
        service.searchUser(login: login, completion: {[weak self] users, error in
            self?.hideLoading?()
            if let error = error {
                self?.showMessage?(error.localizedDescription)
                return
            }
            if let users = users {
                self?.users = users
            }
        })
    }
    
    func goToUserPage(row: Int) {
        if let username = users?[row].login {
            coordinator?.goToUserPage(username: username)
        }
    }
}

extension HomeViewModel: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(UserTableViewCell.self)", for: indexPath) as? UserTableViewCell
        if let user = users?[indexPath.row] {
            cell?.setupCell(user: user)
        }
        
        return cell ?? UITableViewCell()
    }
}
