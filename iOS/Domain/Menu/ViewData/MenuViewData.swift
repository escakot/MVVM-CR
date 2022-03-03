//
//  MenuViewData.swift
//  MVVM-CR
//
//  Created by Errol Cheong on 2022-03-14.
//

import UIKit

struct MenuViewData {
    let uuid: String
    let items: [MenuItemViewData]
}
struct MenuItemViewData {
    let uuid: String = UUID().uuidString
    let image: UIImage?
    let title: String
    let description: String
    let price: String
}
