//
//  Menu.swift
//  MVVM-CR
//
//  Created by Errol Cheong on 2022-03-04.
//

import Foundation

class Menu {
    var uuid: String = UUID().uuidString
    var items: [MenuItem] = [MenuItem](repeating: MenuItem(), count: Int.random(in: 3...5))
    init(uuid: String) {
        self.uuid = uuid
    }
}
