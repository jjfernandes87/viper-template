//
//  ContactCellView.swift
//  SampleApp
//
//  Created by Julio Fernandes on 22/03/22.
//

import UIKit

final class ContactCellView: UITableViewCell {

    static let cellIdentifier = "ContactCellIdentifier"
    static let cellSize = CGFloat(82)
    
    private lazy var container: UIStackView = {
        let container = UIStackView()
        container.spacing = 8
        container.axis = .horizontal
        container.distribution = .fill
        container.alignment = .leading
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
    
    private lazy var subContainer: UIStackView = {
        let container = UIStackView()
        container.spacing = 4
        container.axis = .vertical
        container.distribution = .fill
        container.alignment = .leading
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 17)
        return label
    }()

    private lazy var phoneLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        buildViewHierarchy()
        setupConstraints()
        setupAdditionalConfiguration()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        avatar.image = UIImage(named: "avatar-placeholder")
        nameLabel.text = ""
        phoneLabel.text = ""
    }
}

private extension ContactCellView {
    
    func buildViewHierarchy() {
        addSubview(container)
        container.addArrangedSubview(avatar)
        container.addArrangedSubview(subContainer)
        subContainer.addArrangedSubview(nameLabel)
        subContainer.addArrangedSubview(phoneLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 16),
            container.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            container.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor, constant: -8),
            container.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 16),
        ])
        
        NSLayoutConstraint.activate([
            avatar.widthAnchor.constraint(equalToConstant: 50),
            avatar.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    func setupAdditionalConfiguration() {
        accessoryType = .disclosureIndicator
    }
}

extension ContactCellView {
    func setupCell(contact: ContactEntity) {
        nameLabel.text = contact.name
        phoneLabel.text = contact.phone
    }
}
