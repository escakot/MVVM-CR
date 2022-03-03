//
//  AppCoordinator.swift
//  MVVM-CR
//
//  Created by Errol Cheong on 2022-03-03.
//

import UIKit
import Platform
//import Settings

class AppCoordinator: Coordinator {
    let navigationController: UINavigationController
    let window: UIWindow
//    let container: DependencyContainer

    init(window: UIWindow) {
        self.window = window
        self.navigationController = UINavigationController(rootViewController: UIViewController())
    }
    
    func start() {
        Current.logger.info("AppCoordinator Started", topic: Topic.lifecycle)
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
        MenuCoordinator(navigationController: navigationController).start()
    }
    func orders() {
//        Logger.debug
//        FeatureFlagProvider.variation()
        fatalError()
    }
    func settings() {
//        SettingsCoordinator(navigationController: navigationController,
//                            logger: Current.logger,
//                            featureFlagProvider: Current.featureFlagProvider).start()
    }
}
