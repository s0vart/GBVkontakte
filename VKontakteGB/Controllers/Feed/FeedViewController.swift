//
//  FeedViewController.swift
//  VKontakteGB
//
//  Created by Mark Nevmerzhitskiy on 05.02.2023.
//

import UIKit

class FeedViewController: UIViewController {
    
    //MARK: - Private Properties
    
    let tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Feed"
        view.backgroundColor = .white
        setupConstraints()
        tableView.register(FeedCell.self, forCellReuseIdentifier: "Feed")
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension FeedViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Feed", for: indexPath) as! FeedCell
        cell.configure(image: "person.circle.fill", name: "Alex Jonson")
        return cell
    }
    
    
}

extension FeedViewController {
    
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
