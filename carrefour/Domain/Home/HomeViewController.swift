//
//  HomeViewController.swift
//  carrefour
//
//  Created by Pedro Sousa on 28/06/23.
//

import UIKit
import Toaster

final class HomeViewController: UIViewController {
    
    // MARK: - Properties
    
    private var viewModel: (HomeViewModelProtocol & UITableViewDataSource)
    
    private lazy var mainView: HomeView = {
        let view = HomeView(frame: self.view.frame)
        view.tableView.delegate = self
        view.tableView.dataSource = viewModel
        view.delegate = self
        view.setupView()
        return view
    }()
    
    
    // MARK: - Init
    
    init(viewModel: (HomeViewModelProtocol & UITableViewDataSource)) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Overrides
    
    override public func loadView() {
        super.loadView()
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Home"
        self.setupBind()
        self.viewModel.fetchUsers()
    }
    
    // MARK: - Methods
    
    private func setupBind() {
        
        viewModel.bindUsers = { [weak self] users in
            self?.mainView.reloadData()
        }
        
        viewModel.showLoading = { [weak self] in
            self?.mainView.loadingView.startAnimating()
        }
        
        viewModel.hideLoading = { [weak self] in
            self?.mainView.loadingView.stopAnimating()
        }
        
        viewModel.showMessage = { message in
            Toast(text: message).show()
        }
        
    }

}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let username = viewModel.users?[indexPath.row].login {
            let viewModel = UserViewModel(username: username)
            let viewController = UserViewController(viewModel: viewModel)
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
}

extension HomeViewController: HomeViewDelegate {
    func textFieldDidChange(text: String) {
        viewModel.searchUser(login: text)
    }
}
