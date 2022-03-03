//
//  SettingsViewModel.swift
//  
//
//  Created by Errol Cheong on 2022-03-16.
//

import Foundation

protocol SettingsRouter {
}
class SettingsViewModel {
    var router: SettingsRouter
    
    init(router: SettingsRouter) {
        self.router = router
    }
}
