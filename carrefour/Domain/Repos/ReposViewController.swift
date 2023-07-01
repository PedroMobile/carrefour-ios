//
//  ReposViewController.swift
//  carrefour
//
//  Created by Pedro Sousa on 30/06/23.
//

import UIKit
import Toaster

final class ReposViewController: UIViewController {
    
    // MARK: - Properties
    
    private var viewModel: (ReposViewModelProtocol & UITableViewDataSource)
    
    private lazy var mainView: ReposView = {
        let view = ReposView(frame: self.view.frame)
        view.tableView.delegate = self
        view.tableView.dataSource = viewModel
        view.setupView()
        return view
    }()
    
    
    // MARK: - Init
    
    init(viewModel: (ReposViewModelProtocol & UITableViewDataSource)) {
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
        self.title = Constants.Repo.title.localized
        self.setupBind()
        self.viewModel.fetchRepos()
    }
    
    // MARK: - Methods
    
    private func setupBind() {
        
        viewModel.bindRepos = { [weak self] users in
            self?.mainView.tableView.reloadData()
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

extension ReposViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
