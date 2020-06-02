//
//  BookmarkViewController.swift
//  Owl Onboarding
//
//  Created by Mohamad Naufal Nafian on 02/06/20.
//  Copyright © 2020 Mohamad Naufal Nafian. All rights reserved.
//

import UIKit

class BookmarkViewController: UIViewController {
    
    let labelTitle : UILabel = {
        let label = UILabel()
        label.text = "Bookmark"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = UIColor.rgb(red: 19, green: 134, blue: 167, alpha: 1)
        return label
    }()
    
    let noBookmark : UILabel = {
        let label = UILabel()
        label.text = "no bookmark yet"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = UIColor.rgb(red: 19, green: 134, blue: 167, alpha: 1)
        return label
    }()
    
    let imageView : UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "box")
        img.contentMode = .scaleAspectFill
        return img
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.rgb(red: 237, green: 241, blue: 242, alpha: 1)
        view.insetsLayoutMarginsFromSafeArea = false
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: labelTitle)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.barTintColor = UIColor.rgb(red: 237, green: 241, blue: 242, alpha: 1)

        setupLayout()
    }
    
    func setupLayout() {
        view.addSubview(imageView)
        imageView.anchor(top: view.topAnchor, bottom: nil, leading: nil, trailing:  nil, marginTop: 347, marginBottom: 0, marginLeading: 0, marginTrailing: 0, width: 266, height: 293, centerX: view.centerXAnchor, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
        
        view.addSubview(noBookmark)
        noBookmark.anchor(top: nil, bottom: imageView.topAnchor, leading: nil, trailing: nil, marginTop: 0, marginBottom: -73, marginLeading: 0, marginTrailing: 0, width: 0, height: 0, centerX: view.centerXAnchor, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
    }
    

}
