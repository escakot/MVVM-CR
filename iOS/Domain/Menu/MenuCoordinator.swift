//
//  MenuCoordinator.swift
//  MVVM-CR
//
//  Created by Errol Cheong on 2022-03-03.
//

import UIKit
import Platform

class MenuCoordinator: Coordinator {
    let navigationController: UINavigationController
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    func start() {
        let repository = MenuRepository(database: Current.database, network: Current.network)
        let viewModel = MenuListViewModel(menuRepository: repository, router: self)
        let viewController = MenuListViewController(viewModel)
        navigationController.pushViewController(viewController, animated: true)
    }
    func stop() {
        navigationController.popToRootViewController(animated: true)
    }
    deinit {
        Current.logger.debug("MenuCoordinator deinit", topic: .menu)
    }
}

extension MenuCoordinator: MenuListRouter {
    func navigateToMenuDetail(menuItem: MenuItemViewData) {
        let viewModel = MenuDetailViewModel(data: menuItem, router: self)
        let viewController = MenuDetailViewController(viewModel)
        navigationController.pushViewController(viewController, animated: true)
    }
    func dismissMenuList() {
        navigationController.popToRootViewController(animated: true)
    }
}
extension MenuCoordinator: MenuDetailRouter {
    func dismissMenuDetail() {
        navigationController.popViewController(animated: true)
    }
    func dismissMenu() {
        stop()
    }
}
