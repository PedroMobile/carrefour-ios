//
//  AppCoordinator.swift
//  carrefour
//
//  Created by Pedro Sousa on 02/07/23.
//

import Foundation
import UIKit

protocol Coordinator {
    var parentCoordinator: Coordinator? { get set }
    var children: [Coordinator] { get set }
    var navigationController : UINavigationController { get set }
    
    func start()
}

final class AppCoordinator: Coordinator {
    var parentCoordinator: Coordinator?
    var children: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController : UINavigationController) {
        self.navigationController = navigationController
    }
    func start() {
        goToHomePage()
    }
    
    func goToHomePage() {
        let viewModel = HomeViewModel()
        let viewController = HomeViewController(viewModel: viewModel)
        viewModel.coordinator = self
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func goToUserPage(username: String) {
        let viewModel = UserViewModel(username: username)
        let viewController = UserViewController(viewModel: viewModel)
        viewModel.coordinator = self
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func goToReposPage(username: String) {
        let viewModel = ReposViewModel(username: username)
        let viewController = ReposViewController(viewModel: viewModel)
        navigationController.pushViewController(viewController, animated: true)
    }

}
