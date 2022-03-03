//
//  MenuViewModel.swift
//  MVVM-CR
//
//  Created by Errol Cheong on 2022-03-03.
//

import Foundation
import Combine
import UIKit

protocol MenuListRouter: AnyObject {
    func navigateToMenuDetail(menuItem: MenuItemViewData)
    func dismissMenuList()
}
class MenuListViewModel {
    @Published var data: [MenuViewData] = []
    private let repository: MenuRepository
    private let router: MenuListRouter
    init(menuRepository: MenuRepository, router: MenuListRouter) {
        self.repository = menuRepository
        self.router = router
    }
    
    func fetchData() {
        repository.getMenus { result in
            switch result {
            case .success(let menus):
                self.data = menus.map { menu in
                    return MenuViewData(uuid: menu.uuid,
                                        items: menu.items.map { item in
                                            return MenuItemViewData(image: UIImage(data: item.image),
                                                                    title: item.title,
                                                                    description: item.description,
                                                                    price: "$\(item.price)")
                                        })
                }
            case .failure(let error):
                Current.logger.warn("Failed to get Menu",
                                    topic: Topic.menu,
                                    errorKind: ErrorKind.repository,
                                    error: error.localizedDescription)
            }
        }
    }
    
    func didSelectMenuItem(at indexPath: IndexPath) {
        let item = data[indexPath.section].items[indexPath.row]
        router.navigateToMenuDetail(menuItem: item)
    }
}
