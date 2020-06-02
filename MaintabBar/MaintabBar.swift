//
//  MaintabBar.swift
//  Owl Onboarding
//
//  Created by Mohamad Naufal Nafian on 02/06/20.
//  Copyright © 2020 Mohamad Naufal Nafian. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    let titleLabel = UILabel()
    
    let labelTitle : UILabel = {
        let label = UILabel()
        label.text = "Class"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = UIColor.rgb(red: 19, green: 134, blue: 167, alpha: 1)
        return label
    }()
    
    override func viewDidLoad(){
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
//        view.insetsLayoutMarginsFromSafeArea = false
//        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: labelTitle)
//        self.navigationController?.isNavigationBarHidden = true
//        navigationController?.navigationBar.barTintColor = .black
//        navigationController?.navigationBar.shadowImage = UIImage()
//        navigationController?.navigationBar.barTintColor = UIColor.rgb(red: 237, green: 241, blue: 242, alpha: 1)
//        
        //self.navigationController?.navigationBar.shadowImage = UIImage()
        //self.navigationController?.navigationBar.barTintColor = UIColor.rgb(red: 237, green: 241, blue: 242, alpha: 1)

        setupTabBar()
//        setupNavBar ()

    }
    
//    override func viewWillDisappear(_ animated: Bool) {
//        self.navigationController?.setNavigationBarHidden(false, animated: animated);
//        super.viewWillDisappear(animated)
//    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
//    func setupNavBar () {
//        let search = UIImage(systemName: "magnifyingglass")
//        let menu  = UIImage(systemName: "list.dash")
//
//        let searchButton   = UIBarButtonItem(image: search,  style: .done, target: self, action: Selector(("didTapEditButton:")))
//        searchButton.tintColor = .white
//        let menuButton = UIBarButtonItem(image: menu,  style: .plain, target: self, action: Selector(("didTapSearchButton:")))
//        menuButton.tintColor = .white
//
//        navigationItem.rightBarButtonItems = [menuButton, searchButton]
//    }

    func setupTabBar(){
        tabBar.tintColor = UIColor.rgb(red: 16, green: 120, blue: 149, alpha: 1)
        let classMenu = UINavigationController(rootViewController: ClassMenu())
        classMenu.tabBarItem.image = UIImage(named: "classunfill")
        classMenu.tabBarItem.selectedImage = UIImage(named: "class filled")
        
        let learnMenu = UINavigationController(rootViewController: LearnViewController())
        learnMenu.tabBarItem.image = UIImage(named: "learnunfill")
        learnMenu.tabBarItem.selectedImage = UIImage(named: "learnfill")
        
        let bookmarkMenu = UINavigationController(rootViewController: BookmarkViewController())
        bookmarkMenu.tabBarItem.image = UIImage(named: "bookmarkunfill")
        bookmarkMenu.tabBarItem.selectedImage = UIImage(named: "bookmarkfill")
        
        let notifMenu = UINavigationController(rootViewController: NotificationViewController())
        notifMenu.tabBarItem.image = UIImage(named: "notifunfill")
        notifMenu.tabBarItem.selectedImage = UIImage(named: "notiffill")
        
        viewControllers = [classMenu, learnMenu, bookmarkMenu, notifMenu]

        
    }
    
    override var selectedViewController: UIViewController? {
        didSet {
            tabChangedTo(selectedIndex: selectedIndex)
        }
    }
    
    override var selectedIndex: Int {
        didSet {
            tabChangedTo(selectedIndex: selectedIndex)
        }
    }
    
    func tabChangedTo(selectedIndex: Int) {
//        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width-32, height: view.frame.height))
//        titleLabel.textColor = .white
//        titleLabel.font = UIFont.systemFont(ofSize: 20)
//        navigationItem.titleView = titleLabel
//
//        if (selectedIndex) == 0 {
//            titleLabel.text = "Home"
//        } else if (selectedIndex) == 1 {
//            titleLabel.text = "Trending"
//        } else if (selectedIndex) == 2 {
//            titleLabel.text = "Subscription"
//        } else if (selectedIndex) == 3 {
//            titleLabel.text = "Profile"
//        }
    }

}
