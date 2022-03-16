//
//  OrdersCoordinator.swift
//  
//
//  Created by Errol Cheong on 2022-03-16.
//

import UIKit
import Platform
import SwiftUI

public class OrdersCoordinator: Coordinator {
    public var navigationController: UINavigationController
    
    public init(
        navigationController: UINavigationController,
        logger: Platform.Logger,
        featureFlagProvider: Platform.FeatureFlagProvider
    ) {
        self.navigationController = navigationController
        Logger.setLogger(logger)
        FeatureFlagProvider.setProvider(featureFlagProvider)
    }
    public func start() {
        Logger.debug("OrdersCoordinator start")
        let viewModel = OrdersListViewModel(router: self)
        let viewController = UIHostingController(rootView: OrdersList(viewModel))
        navigationController.pushViewController(viewController, animated: true)
    }
    deinit {
        Logger.debug("OrdersCoordinator deinit")
    }
}

extension OrdersCoordinator: OrdersListRouter {
    
}

