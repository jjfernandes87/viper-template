//
//  ContactListViewController.swift
//  SampleApp
//
//  Created by Julio Fernandes on 22/03/22.
//

import UIKit

final class ContactListViewController: UIViewController {
    
    // MARK: - VIPER Properties
    private let presenter: ContactListPresenterInputProtocol

    // MARK: - Private Properties
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.delegate = self
        table.dataSource = self
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(ContactCellView.self, forCellReuseIdentifier: ContactCellView.cellIdentifier)
        return table
    }()

    // MARK: - Inits
    init(presenter: ContactListPresenterInputProtocol) {
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
        presenter.fetchData()
    }
    
}

// MARK: - Private Methods && View code
private extension ContactListViewController {
    
    func setupView() {
        buildViewHierarchy()
        setupConstraints()
        setupAdditionalConfiguration()
    }
    
    func buildViewHierarchy() {
        view.addSubview(tableView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        ])
    }
    
    func setupAdditionalConfiguration() {
        title = "Contact List"
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationItem.largeTitleDisplayMode = .never
    }
    
}

// MARK: - Presenter Output Protocol
extension ContactListViewController: ContactListPresenterOutputProtocol {

    func showData() {
        tableView.reloadData()
    }
}

// MARK: - UITableViewDataSource Protocol
extension ContactListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ContactCellView.cellIdentifier, for: indexPath) as? ContactCellView
        cell?.setupCell(contact: presenter.contactListForRowAt(indexPath))
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ContactCellView.cellSize
    }
    
}

// MARK: - UITableViewDelegate Protocol
extension ContactListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelectRowAt(indexPath)
    }
    
}
