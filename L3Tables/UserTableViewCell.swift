//
//  UserTableViewCell.swift
//  L3Tables
//
//  Created by Artem on 20.09.2023.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    
//    static let reuseIdentifier = ""

    private lazy var avatarImageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .red
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .purple
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var rightSideLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .green
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupLayout()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        avatarImageView.image = nil
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(with user: User) {
        
        avatarImageView.image = user.avatarImage
        titleLabel.text = user.name
        subtitleLabel.text = user.lastName
        rightSideLabel.text = user.age
    }
    
    private func setupLayout() {
        
        guard avatarImageView.superview == nil else { return }
        
        let mainStackView = UIStackView(arrangedSubviews: [titleLabel, subtitleLabel])
        mainStackView.axis = .vertical
        mainStackView.distribution = .fillEqually
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(avatarImageView)
        contentView.addSubview(mainStackView)
        contentView.addSubview(rightSideLabel)
        
        
        NSLayoutConstraint.activate([
            avatarImageView.heightAnchor.constraint(equalToConstant: 30),
            avatarImageView.widthAnchor.constraint(equalToConstant: 30),
            avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
           // avatarImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            mainStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),
            mainStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
          //  rightSideLabel.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor),
            rightSideLabel.centerYAnchor.constraint(equalTo: mainStackView.centerYAnchor),
            rightSideLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
                ])
    }
}


extension UITableViewCell {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
