//
//  MenuDetailViewModel.swift
//  MVVM-CR
//
//  Created by Errol Cheong on 2022-03-14.
//

import Foundation

protocol MenuDetailRouter: AnyObject {
    func dismissMenuDetail()
    func dismissMenu()
}
class MenuDetailViewModel {
    private let router: MenuDetailRouter
    var data: MenuItemViewData
    
    init(data: MenuItemViewData, router: MenuDetailRouter) {
        self.data = data
        self.router = router
    }
    
    func dismiss() {
        router.dismissMenuDetail()
    }
    func closeMenu() {
        router.dismissMenu()
    }
}
