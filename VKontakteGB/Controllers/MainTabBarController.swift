//
//  MainTabBarController.swift
//  VKontakteGB
//
//  Created by Mark Nevmerzhitskiy on 05.02.2023.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createTabBar()
    }
    
    //MARK: - Private Method
    
    private func createTabBar() {
        let newsViewController = createNavBar(vc: NewsViewController(), itemName: "News", itemImage: "newspaper.fill")
        let feedViewController = createNavBar(vc: FeedViewController(), itemName: "Feed", itemImage: "person.3.fill")
        let messageViewController = createNavBar(vc: MessageViewController(), itemName: "Message", itemImage: "ellipsis.message.fill")
        let profileViewController = createNavBar(vc: ProfileViewController(), itemName: "Profile", itemImage: "person.circle.fill")
        
        viewControllers = [newsViewController, feedViewController, messageViewController, profileViewController]
    }
    
    private func createNavBar(vc: UIViewController, itemName: String, itemImage: String) -> UINavigationController {
        let barItem = UITabBarItem(title: itemName, image: UIImage(systemName: itemImage), tag: 0)
        let navController = UINavigationController(rootViewController: vc)
        navController.tabBarItem = barItem
        return navController
    }
}
