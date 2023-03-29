//
//  FeedViewController.swift
//  VKontakteGB
//
//  Created by Mark Nevmerzhitskiy on 16.03.2023.
//

import UIKit

class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var table: UITableView!
    
    var posts: [Post] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "News"
        
        APIManager.shared.getPost(id: "post1", imageID: "1") { res1 in
            self.posts.append(res1!)
            APIManager.shared.getPost(id: "post2", imageID: "2") { res2 in
                self.posts.append(res2!)
                APIManager.shared.getPost(id: "post3", imageID: "3") { res3 in
                    self.posts.append(res3!)
                    APIManager.shared.getPost(id: "post4", imageID: "4") { res4 in
                        self.posts.append(res4!)
                        DispatchQueue.main.async {
                            self.table.reloadData()
                        }
                    }
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Feed", for: indexPath) as! FeedTableViewCell
        cell.name.text = posts[indexPath.row].name
        cell.date.text = posts[indexPath.row].date
        cell.textPosts.text = posts[indexPath.row].text
        cell.imagePosts.image = posts[indexPath.row].image
        return cell
    }

}
