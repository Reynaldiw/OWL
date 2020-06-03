//
//  MainTabBar.swift
//  owl
//
//  Created by Reynaldi Wijaya on 03/06/20.
//  Copyright © 2020 Reynaldi Wijaya. All rights reserved.
//

import UIKit

class MainTabBar: UITabBarController {

    override func viewDidLoad() {
        setupTabBar()
    }
    
    func setupTabBar(){
        tabBar.tintColor = UIColor.rgb(red: 16, green: 120, blue: 149, alpha: 1)
        let classMenu = UINavigationController(rootViewController: ClassVC())
        classMenu.tabBarItem.image = UIImage(named: "classunfill")
        classMenu.tabBarItem.selectedImage = UIImage(named: "class filled")
        
        let learnMenu = UINavigationController(rootViewController: LearnVC())
        learnMenu.tabBarItem.image = UIImage(named: "learnunfill")
        learnMenu.tabBarItem.selectedImage = UIImage(named: "learnfill")
        
        let bookmarkMenu = UINavigationController(rootViewController: BookmarkVC())
        bookmarkMenu.tabBarItem.image = UIImage(named: "bookmarkunfill")
        bookmarkMenu.tabBarItem.selectedImage = UIImage(named: "bookmarkfill")
        
        let notifMenu = UINavigationController(rootViewController: NotificationVC())
        notifMenu.tabBarItem.image = UIImage(named: "notifunfill")
        notifMenu.tabBarItem.selectedImage = UIImage(named: "notiffill")
        
        viewControllers = [classMenu, learnMenu, bookmarkMenu, notifMenu]

        
    }
    

}
