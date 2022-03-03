//
//  SettingsViewController.swift
//  
//
//  Created by Errol Cheong on 2022-03-16.
//

import UIKit

class SettingsViewController: UIViewController {
    let viewModel: SettingsViewModel
    init(_ viewModel: SettingsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
