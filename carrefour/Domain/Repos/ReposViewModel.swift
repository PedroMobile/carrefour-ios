//
//  ReposViewModel.swift
//  carrefour
//
//  Created by Pedro Sousa on 30/06/23.
//

import Foundation
import UIKit

protocol ReposViewModelProtocol {
    var showLoading: (() -> ())? { get set }
    var hideLoading: (() -> ())? { get set }
    var showMessage: ((String) -> ())? { get set }
    var bindRepos: (([Repo]) -> ())? { get set }
    func fetchRepos()
}

final class ReposViewModel: NSObject, ReposViewModelProtocol {
    
    private var service = Service.shared
    
    var showLoading: (() -> ())?
    var hideLoading: (() -> ())?
    var showMessage: ((String) -> ())?
    var bindRepos: (([Repo]) -> ())?
    
    private var username: String
    
    private var repos:[Repo]? {
        didSet {
            if let repos = repos {
                bindRepos?(repos)
            }
        }
    }
    
    init(username: String) {
        self.username = username
    }
    
    func fetchRepos() {
        self.showLoading?()
        service.fetchRepos(login: username) {[weak self] repos, error in
            self?.hideLoading?()
            if let error = error {
                self?.showMessage?(error.localizedDescription)
                return
            }
            if let repos = repos {
                self?.repos = repos
            }
        }
    }
}

extension ReposViewModel: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repos?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(AppTableViewCell.self)", for: indexPath) as? AppTableViewCell
        if let repo = repos?[indexPath.row].name {
            cell?.setupCell(text: repo)
        }
        
        return cell ?? UITableViewCell()
    }
    
}
