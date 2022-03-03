//
//  MenuDetailViewController.swift
//  MVVM-CR
//
//  Created by Errol Cheong on 2022-03-14.
//

import UIKit

class MenuDetailViewController: UIViewController {
    let viewModel: MenuDetailViewModel
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    private lazy var closeButton: UIButton = {
        let button = UIButton()
        button.setTitle("Close Menu", for: .normal)
        button.backgroundColor = .gray
        return button
    }()
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [imageView, titleLabel, descriptionLabel, priceLabel, closeButton])
        stackView.axis = .vertical
        stackView.spacing = 8
        return stackView
    }()

    init(_ viewModel: MenuDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupBindings()
    }
    func setupView() {
        closeButton.addTarget(self, action: #selector(didTapClose), for: .primaryActionTriggered)
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            closeButton.heightAnchor.constraint(equalToConstant: 30),
        ])
    }
    func setupBindings() {
        imageView.image = viewModel.data.image
        titleLabel.text = viewModel.data.title
        descriptionLabel.text = viewModel.data.description
        priceLabel.text = viewModel.data.price
    }
    @objc func didTapClose() {
        let alert = UIAlertController(title: "Close Menu?", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Confirm", style: .default, handler: { _ in
            self.viewModel.closeMenu()
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alert, animated: true)
    }
}
