//
//  MenuRepository.swift
//  MVVM-CR
//
//  Created by Errol Cheong on 2022-03-03.
//

import Foundation

protocol DatabaseLayer {}
class Database: DatabaseLayer {}
protocol NetworkLayer {}
class Network: NetworkLayer {}
class MenuRepository {
    
    private let database: DatabaseLayer
    private let network: NetworkLayer
    private let mockData: [Menu] = [
        Menu(uuid: "uuid-1"),
        Menu(uuid: "uuid-2"),
    ]
    
    init(database: DatabaseLayer, network: NetworkLayer) {
        self.database = database
        self.network = network
    }
    
    func getMenus(_ completion: @escaping ((Result<[Menu], Error>) -> Void)) {
        DispatchQueue.global(qos: .userInteractive).asyncAfter(deadline: .now() + 1, execute: {
            completion(.success(self.mockData))
        })
    }

    func getMenuItems(uuid: String, _ completion: @escaping ((Result<[MenuItem], Error>) -> Void)) {
        // Database Calls
        // Network Calls
        // Do Some Work
        DispatchQueue.global(qos: .userInteractive).asyncAfter(deadline: .now() + 2, execute: {
            if let menu = self.mockData.first(where: { $0.uuid == uuid }) {
                completion(.success(menu.items))
            } else {
                completion(.failure(NSError()))
            }
        })
    }
}
