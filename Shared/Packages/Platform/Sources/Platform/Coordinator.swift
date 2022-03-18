//
//  Coordinator.swift
//  
//
//  Created by Errol Cheong on 2022-03-10.
//

#if os(iOS)
import UIKit

public protocol Coordinator: AnyObject {
    var navigationController: UINavigationController { get }
    func start()
    func stop()
}
#endif
