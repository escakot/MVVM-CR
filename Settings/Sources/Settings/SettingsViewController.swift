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
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    func setupView() {
        view.backgroundColor = .white
        let label = UILabel()
        label.text = "Settings"
        label.font = .systemFont(ofSize: 40)
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
}
