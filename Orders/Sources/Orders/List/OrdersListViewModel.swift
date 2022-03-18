//
//  OrdersListViewModel.swift
//  
//
//  Created by Errol Cheong on 2022-03-16.
//

import Foundation

protocol OrdersListRouter {
    func navigateToSettings()
}

class OrdersListViewModel {
    var router: OrdersListRouter
    init(router: OrdersListRouter) {
        self.router = router
    }
    func showSettings() {
        router.navigateToSettings()
    }
}
