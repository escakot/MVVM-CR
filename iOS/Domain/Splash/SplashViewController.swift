//
//  SplashViewController.swift
//  MVVM-CR
//
//  Created by Errol Cheong on 2022-03-03.
//

import UIKit

class SplashViewController: UIViewController {
    
    private let viewModel: SplashViewModel
    
    init(_ viewModel: SplashViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "touchbistro")
        imageView.layer.cornerRadius = 16
        return imageView
    }()
    private lazy var menuButton: UIButton = {
        let button = UIButton()
        button.setTitle("Menu", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(didTapMenu), for: .primaryActionTriggered)
        return button
    }()
    private lazy var ordersButton: UIButton = {
        let button = UIButton()
        button.setTitle("Order", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(didTapOrders), for: .primaryActionTriggered)
        return button
    }()
    private lazy var settingsButton: UIButton = {
        let button = UIButton()
        button.setTitle("Settings", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(didTapSettings), for: .primaryActionTriggered)
        return button
    }()
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [menuButton, ordersButton, settingsButton])
        stackView.distribution = .fillEqually
        stackView.spacing = 8
        return stackView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
    }
    
    private func setupView() {
        view.addSubview(imageView)
        view.addSubview(stackView)
    }
    private func setupConstraints() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imageView.widthAnchor.constraint(equalTo: view.widthAnchor),
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor),
            stackView.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 8),
            stackView.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -8),
            stackView.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -8),
        ])
    }
    @objc func didTapMenu() {
        viewModel.presentMenu()
    }
    @objc func didTapOrders() {
        viewModel.presentOrders()
    }
    @objc func didTapSettings() {
        viewModel.presentSettings()
    }
}
