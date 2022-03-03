//
//  SettingsCoordinator.swift
//  
//
//  Created by Errol Cheong on 2022-03-16.
//

import UIKit
import Platform

public class SettingsCoordinator: Coordinator {
    public let navigationController: UINavigationController
    
    public init(navigationController: UINavigationController,
         logger: Logger,
         featureFlagProvider: FeatureFlagProvider) {
        self.navigationController = navigationController
        FeatureFlagProvider.
    }
    public func start() {
        let viewModel = SettingsViewModel(router: self)
        let settingsVC = SettingsViewController(viewModel)
        navigationController.pushViewController(settingsVC, animated: true)
    }
    deinit {
//        Current.logger.debug("SettingsCoordinator deinit", extra: [:])
    }
}

extension SettingsCoordinator: SettingsRouter {
}
