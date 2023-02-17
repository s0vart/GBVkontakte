//
//  MessageViewController.swift
//  VKontakteGB
//
//  Created by Mark Nevmerzhitskiy on 05.02.2023.
//

import UIKit

class MessageViewController: UIViewController {
    
    //MARK: - Private Properties
    
    let tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Message"
        view.backgroundColor = .white
        setupConstraints()
        tableView.register(MessageCell.self, forCellReuseIdentifier: "Message")
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension MessageViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Message", for: indexPath) as! MessageCell
        return cell
    }
    
    
}

extension MessageViewController {
    
    private func setupConstraints() {
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
    }
}
