//
//  MessageCell.swift
//  VKontakteGB
//
//  Created by Mark Nevmerzhitskiy on 14.02.2023.
//

import UIKit

class MessageCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: "Message")
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let labelText: UILabel = {
        let lable = UILabel()
        lable.text = "Hello Message!"
        lable.translatesAutoresizingMaskIntoConstraints = false
        return lable
    }()
}

extension MessageCell {
    
    func setupConstraints() {
        self.addSubview(labelText)
        NSLayoutConstraint.activate([
            labelText.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            labelText.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            labelText.widthAnchor.constraint(equalToConstant: 150),
            labelText.heightAnchor.constraint(equalToConstant: 25)
        ])
    }
}
