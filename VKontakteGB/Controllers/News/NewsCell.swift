//
//  NewsCell.swift
//  VKontakteGB
//
//  Created by Mark Nevmerzhitskiy on 09.02.2023.
//

import UIKit

class NewsCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: "News")
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let groupImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let groupName: UILabel = {
        let lable = UILabel()
        lable.translatesAutoresizingMaskIntoConstraints = false
        return lable
    }()
    
    let postText: UILabel = {
        let text = UILabel()
        text.numberOfLines = 0
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    let postImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    func configure(avatar: String?, name: String, post: String, photo: String?) {
        groupImage.image = UIImage(systemName: avatar!)
        groupName.text = name
        postText.text = post
        postImage.image = UIImage(systemName: photo!)
    }
}

extension NewsCell {
    
    func setupConstraints() {
        self.addSubview(groupImage)
        NSLayoutConstraint.activate([
            groupImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            groupImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            groupImage.widthAnchor.constraint(equalToConstant: 45),
            groupImage.heightAnchor.constraint(equalToConstant: 45)
        ])
        
        self.addSubview(groupName)
        NSLayoutConstraint.activate([
            groupName.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            groupName.leadingAnchor.constraint(equalTo: groupName.trailingAnchor, constant: 15),
            groupName.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 10),
            groupName.widthAnchor.constraint(equalToConstant: 325),
            groupName.heightAnchor.constraint(equalToConstant: 45)
        ])
        
        self.addSubview(postText)
        NSLayoutConstraint.activate([
            postText.topAnchor.constraint(equalTo: groupName.bottomAnchor, constant: 25),
            postText.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            postText.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)
        ])
        
        self.addSubview(postImage)
        NSLayoutConstraint.activate([
            postImage.topAnchor.constraint(equalTo: postText.bottomAnchor, constant: 15),
            postImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 17),
            postImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -17),
            postImage.heightAnchor.constraint(equalToConstant: 200),
            postImage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20)
        ])
        
    }
}
