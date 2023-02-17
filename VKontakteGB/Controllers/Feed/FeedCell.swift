//
//  FeedCell.swift
//  VKontakteGB
//
//  Created by Mark Nevmerzhitskiy on 14.02.2023.
//

import UIKit

class FeedCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: "Feed")
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let userImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let nameLabel: UILabel = {
        let lable = UILabel()
        lable.text = "Hello Feed!"
        lable.translatesAutoresizingMaskIntoConstraints = false
        return lable
    }()
    
    func configure(image: String?, name: String) {
        userImage.image = UIImage(systemName: image!)
        nameLabel.text = name
    }
}

extension FeedCell {
    
    func setupConstraints() {
        self.addSubview(userImage)
        NSLayoutConstraint.activate([
            userImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),
            userImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            userImage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15),
            userImage.widthAnchor.constraint(equalToConstant: 50),
            userImage.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        self.addSubview(nameLabel)
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),
            nameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            nameLabel.leadingAnchor.constraint(equalTo: userImage.trailingAnchor, constant: 15),
            nameLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15)
        ])
    }
}
