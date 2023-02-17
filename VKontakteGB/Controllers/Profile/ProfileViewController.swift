//
//  ProfileViewController.swift
//  VKontakteGB
//
//  Created by Mark Nevmerzhitskiy on 05.02.2023.
//

import UIKit

class ProfileViewController: UIViewController {
    
    //MARK: - Public Properties
    
    let exitButton: UIButton = {
        let button = UIButton()
        button.setTitle("LOGOUT", for: .normal)
        button.tintColor = .red
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        view.backgroundColor = .white
    }
}

extension ProfileViewController {
    
    func setupConstraints() {
        navigationController?.navigationBar.addSubview(exitButton)
        NSLayoutConstraint.activate([
            exitButton.topAnchor.constraint(equalTo: (navigationController?.navigationBar.topAnchor)!, constant: 16),
            exitButton.bottomAnchor.constraint(equalTo: (navigationController?.navigationBar.bottomAnchor)!, constant: -16),
            exitButton.trailingAnchor.constraint(equalTo: (navigationController?.navigationBar.trailingAnchor)!, constant: -16),
            exitButton.widthAnchor.constraint(equalToConstant: 70),
            exitButton.heightAnchor.constraint(equalToConstant: 35)
        ])
    }
}
