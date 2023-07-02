//
//  UserViewController.swift
//  carrefour
//
//  Created by Pedro Sousa on 30/06/23.
//

import UIKit
import Toaster

class UserViewController: UIViewController {

    // MARK: - Properties
    
    private var viewModel: (UserViewModelProtocol & UITableViewDataSource)
    
    private lazy var mainView: UserView = {
        let view = UserView(frame: self.view.frame)
        view.tableView.dataSource = viewModel
        view.setupView()
        return view
    }()
    
    
    // MARK: - Init
    
    init(viewModel: (UserViewModelProtocol & UITableViewDataSource)) {
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
        self.title = self.viewModel.username
        self.setupBind()
        self.viewModel.fetchUser()
    }
    
    // MARK: - Methods
    
    private func setupBind() {
        
        viewModel.bindUserName = { [weak self] name in
            self?.mainView.bindUserName(name: name)
        }
        
        viewModel.bindUserImage = { [weak self] image in
            self?.mainView.bindUserImage(imageURL: image)
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
        
        viewModel.bindUserParams = { [weak self] in
            self?.mainView.tableView.reloadData()
        }
        
        mainView.goToReposPage = { [weak self] in
            self?.viewModel.goToReposPage()
        }
    }

}
