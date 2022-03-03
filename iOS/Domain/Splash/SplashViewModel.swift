//
//  SplashViewModel.swift
//  MVVM-CR
//
//  Created by Errol Cheong on 2022-03-16.
//

import Foundation

protocol SplashRouter: AnyObject {
    func menu()
    func orders()
    func settings()
}

class SplashViewModel {
    private let router: SplashRouter
    
    init(router: SplashRouter) {
        self.router = router
    }
    func presentMenu() {
        router.menu()
    }
    func presentOrders() {
        router.orders()
    }
    func presentSettings() {
        router.settings()
    }
}
