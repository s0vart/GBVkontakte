//
//  NewsViewController.swift
//  VKontakteGB
//
//  Created by Mark Nevmerzhitskiy on 05.02.2023.
//

import UIKit

class NewsViewController: UIViewController {
    
    //MARK: - Public Properties
    
    let tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "News"
        view.backgroundColor = .white
        setupConstraints()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(NewsCell.self, forCellReuseIdentifier: "News")
    }
}

extension NewsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "News", for: indexPath) as! NewsCell
        cell.configure(avatar: "cart.circle.fill", name: "СООБЩЕСТВО", post: "Пуговка возвращается в «Папины дочки»! По данным СМИ, 21-летняя Екатерина Старшова снимется в продолжении культового сериала 2000-х.", photo: "questionmark.folder")
        return cell
    }
    
}

extension NewsViewController {
    
    func setupConstraints() {
        
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
    }
    
}

