//
//  AppCoordinator.swift
//  MVVM-CR
//
//  Created by Errol Cheong on 2022-03-03.
//

import UIKit
import Platform
import Settings
import Orders

class AppCoordinator: Coordinator {
    let navigationController: UINavigationController
    let window: UIWindow

    init(window: UIWindow) {
        self.window = window
        self.navigationController = UINavigationController(rootViewController: UIViewController())
    }
    
    func start() {
        Current.logger.info("AppCoordinator start", topic: Topic.lifecycle)
        let viewModel = SplashViewModel(router: self)
        let splashVC = SplashViewController(viewModel)
        navigationController.setViewControllers([splashVC], animated: false)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    func stop() { }
}

extension AppCoordinator: SplashRouter {
    func menu() {
        MenuCoordinator(
            navigationController: navigationController
        ).start()
    }
    func orders() {
        OrdersCoordinator(
            navigationController: navigationController,
            router: self,
            logger: Current.logger,
            featureFlag: Current.featureFlagProvider
        ).start()
    }
    func settings() {
        SettingsCoordinator(
            navigationController: navigationController,
            logger: Current.logger,
            featureFlag: Current.featureFlagProvider
        ).start()
    }
}

extension AppCoordinator: OrdersRouter {
    func settingsCoordinator() {
        settings()
    }
}
