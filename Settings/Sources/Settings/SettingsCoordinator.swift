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
                logger: Platform.Logger,
                featureFlagProvider: Platform.FeatureFlagProvider) {
        self.navigationController = navigationController
        FeatureFlagProvider.setProvider(featureFlagProvider)
        Logger.setLogger(logger)
    }
    public func start() {
        Logger.debug("OrdersCoordinator start")
        let viewModel = SettingsViewModel(router: self)
        let settingsVC = SettingsViewController(viewModel)
        navigationController.pushViewController(settingsVC, animated: true)
    }
    deinit {
        Logger.debug("SettingsCoordinator deinit", extra: [:])
    }
}

extension SettingsCoordinator: SettingsRouter {
}
