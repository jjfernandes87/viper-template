//
//  DetailContactViewController.swift
//  SampleApp
//
//  Created by Julio Fernandes on 23/03/22.
//

import UIKit

final class DetailContactViewController: UIViewController {
    
    // MARK: - VIPER Properties
    private let presenter: DetailContactPresenterInputProtocol

    // MARK: - Private Properties
    private lazy var container: UIStackView = {
        let container = UIStackView()
        container.spacing = 16
        container.axis = .vertical
        container.distribution = .fill
        container.alignment = .center
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    private lazy var avatar: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 25
        imageView.layer.masksToBounds = true
        imageView.image = UIImage(named: "avatar-placeholder")
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 22)
        return label
    }()

    private lazy var phoneLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .gray
        return label
    }()
    
    private lazy var actionContainer: UIStackView = {
        let container = UIStackView()
        container.spacing = 8
        container.axis = .horizontal
        container.distribution = .fillEqually
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()

    // MARK: - Inits
    init(presenter: DetailContactPresenterInputProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        nil
    }
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter.fetchData()
    }
    
    // MARK: - Actions
    @objc func didSendMessage() {
        presenter.didSendMessage()
    }
    
    @objc func calling() {
        presenter.calling()
    }
    
    @objc func faceTime() {
        presenter.faceTime()
    }
    
    @objc func sendMail() {
        presenter.sendMail()
    }
}

// MARK: - Private Methods && View Code
private extension DetailContactViewController {
    func setupView() {
        buildViewHierarchy()
        setupConstraints()
        setupAdditionalConfiguration()
    }
    
    func buildViewHierarchy() {
        view.addSubview(container)
        view.addSubview(actionContainer)
        container.addArrangedSubview(avatar)
        container.addArrangedSubview(nameLabel)
        container.addArrangedSubview(phoneLabel)
        container.addArrangedSubview(actionContainer)
        actionContainer.addArrangedSubview(makeButton("message", action: #selector(didSendMessage)))
        actionContainer.addArrangedSubview(makeButton("ligar", action: #selector(calling)))
        actionContainer.addArrangedSubview(makeButton("vídeo", action: #selector(faceTime)))
        actionContainer.addArrangedSubview(makeButton("-email", action: #selector(sendMail)))

    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            container.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            container.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8),
        ])
        
        let containerbBottomAnchor = container.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        containerbBottomAnchor.isActive = true
        containerbBottomAnchor.priority = .defaultLow
        
        NSLayoutConstraint.activate([
            avatar.widthAnchor.constraint(equalToConstant: 50),
            avatar.heightAnchor.constraint(equalToConstant: 50),
        ])
        
        NSLayoutConstraint.activate([
            actionContainer.heightAnchor.constraint(equalToConstant: 44),
        ])
        
    }
    
    func setupAdditionalConfiguration() {
        
    }
    
    func makeButton(_ title: String, action: Selector) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle("  \(title)  ", for: .normal)
        button.addTarget(self, action: action, for: .touchUpInside)
        button.tintColor = .white
        button.titleLabel?.font = .systemFont(ofSize: 12)
        button.backgroundColor = .gray
        button.layer.cornerRadius = 5
        return button
    }
}

// MARK: - Presenter Output Protocol
extension DetailContactViewController: DetailContactPresenterOutputProtocol {
    func showData(contact: ContactEntity) {
        nameLabel.text = contact.name
        phoneLabel.text = contact.phone
    }
}
