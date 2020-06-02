//
//  ClassMenu.swift
//  Owl Onboarding
//
//  Created by Mohamad Naufal Nafian on 02/06/20.
//  Copyright © 2020 Mohamad Naufal Nafian. All rights reserved.
//

import UIKit



import UIKit


class ClassMenu: UIViewController, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {


    let collectionView : UICollectionView = {
    
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 30
        layout.scrollDirection = .vertical
    
        let cv = UICollectionView(frame: .zero , collectionViewLayout: layout)
        cv.backgroundColor = UIColor.rgb(red: 237, green: 241, blue: 242, alpha: 1)
        return cv
    }()
    
    let labelTitle : UILabel = {
        let label = UILabel()
        label.text = "Class"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = UIColor.rgb(red: 19, green: 134, blue: 167, alpha: 1)
        return label
    }()
    
    let topMenu = "topMenuCellId"
    let newsSlider = "featuredCellId"
    let liveClass = "liveClassCellId"
    let discussionForum = "discussionForumCellId"
    let popularProject = "popularProjectCellId"
        
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //navigationController?.isNavigationBarHidden = true
        view.insetsLayoutMarginsFromSafeArea = false
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: labelTitle)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.barTintColor = UIColor.rgb(red: 237, green: 241, blue: 242, alpha: 1)
        
        //navigationController?.navigationBar.prefersLargeTitles = true
        
        collectionView.register(TopMenuCell.self, forCellWithReuseIdentifier: topMenu)
        collectionView.register(NewsSliderCell.self, forCellWithReuseIdentifier: newsSlider)
        collectionView.register(LiveClassCell.self, forCellWithReuseIdentifier: liveClass)
        collectionView.register(DiscussionForumCell.self, forCellWithReuseIdentifier: discussionForum)
        collectionView.register(PopularProjectCell.self, forCellWithReuseIdentifier: popularProject)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        view.addSubview(collectionView)
        setupView()
    }

    
    func setupView () {
        

        view.addSubview(collectionView)
        collectionView.anchor(top: view.topAnchor, bottom: view.bottomAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor, marginTop: 0, marginBottom: 0, marginLeading: 0, marginTrailing: 0, width: 0, height: 0, centerX: nil, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
        collectionView.insetsLayoutMarginsFromSafeArea = false
       
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: topMenu, for: indexPath) as! TopMenuCell
            //cell.backgroundColor = .red
            return cell
        } else if indexPath.section == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: newsSlider, for: indexPath) as! NewsSliderCell
            //cell.backgroundColor = .cyan
            return cell
        } else if indexPath.section == 2 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: liveClass, for: indexPath) as! LiveClassCell
            //cell.backgroundColor = .cyan
            return cell
        } else if indexPath.section == 3 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: discussionForum, for: indexPath) as! DiscussionForumCell
            //cell.backgroundColor = .cyan
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: popularProject, for: indexPath) as! PopularProjectCell
            //cell.backgroundColor = .cyan
            return cell
        }
    }

    
        //SIZE FOR ITEM AT --> setting ukuran masing-masing cell dalam section
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            return CGSize(width: view.frame.width - 16, height: 100)
        } else if indexPath.section == 1 {
            return CGSize(width: view.frame.width - 16, height: 191)
        } else if indexPath.section == 2 {
            return CGSize(width: view.frame.width - 16, height: 136)
        } else if indexPath.section == 3 {
            return CGSize(width: view.frame.width - 16, height: 210)
        }else {
            return CGSize(width: view.frame.width - 16, height: 100)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if section == 0 {
            return  UIEdgeInsets(top: 4, left: 8, bottom: 4, right: 8)
        } else if section == 1 {
            return UIEdgeInsets(top: 4, left: 8, bottom: 4, right: 8)
        } else if section == 2 {
            return UIEdgeInsets(top: 4, left: 8, bottom: 4, right: 8)
        } else if section == 3 {
            return UIEdgeInsets(top: 4, left: 8, bottom: 4, right: 8)
        } else {
            return UIEdgeInsets(top: 4, left: 8, bottom: 4, right: 8)
        }
    }
    
}
