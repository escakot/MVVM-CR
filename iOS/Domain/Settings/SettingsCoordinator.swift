//
//  SettingsCoordinator.swift
//  MVVM-CR
//
//  Created by Errol Cheong on 2022-03-03.
//

import UIKit
import Platform

class SettingsCoordinator: Coordinator {
    var childCoordinators: [Coordinator]
    var rootViewController: UIViewController
    
    init(router: SettingsRouter) {
        self.router = router
    }
    func start() {
    }
    func stop() {
    }
}
