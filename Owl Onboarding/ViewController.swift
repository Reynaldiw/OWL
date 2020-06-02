//
//  ViewController.swift
//  Owl Onboarding
//
//  Created by Mohamad Naufal Nafian on 19/05/20.
//  Copyright © 2020 Mohamad Naufal Nafian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var user : User?
    
    let imageView : UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "OWL-Icon")
        img.contentMode = .scaleAspectFill
        return img
    }()
    
    let pageTitle : UILabel = {
        let label = UILabel()
        label.text = "Dashboard"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()
    
    let descriptionTitle : UILabel = {
        let tv = UILabel()
        tv.text = "An app that allow you to Learn, Explore and Teach each other by your on own learning."
        tv.font = UIFont.systemFont(ofSize: 14)
        tv.numberOfLines = 0
        tv.textAlignment = .center
        
        return tv
    }()
    
    let pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = 4
        pc.currentPageIndicatorTintColor = UIColor.rgb(red: 25, green: 203, blue: 204, alpha: 1)
        pc.pageIndicatorTintColor = UIColor.rgb(red: 176, green: 255, blue: 251, alpha: 1)
        return pc
    }()
    
    let nextButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Next", for: .normal)
        btn.backgroundColor = .clear
        btn.layer.cornerRadius = 15
        btn.layer.borderWidth = 1
        btn.layer.borderColor = CGColor.rgb(red: 25, green: 203, blue: 204, alpha: 1)
        btn.setTitleColor(UIColor.rgb(red: 25, green: 203, blue: 204, alpha: 1), for: .normal)

        return btn
    }()
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.rgb(red: 245, green: 245, blue: 245, alpha: 1)
        navigationController?.setNavigationBarHidden(true, animated: true)
        descriptionTitle.text = user?.debugDescription ?? "First name = \(user?.firstName) \(user?.email)"
        
        setupLayout()
    }
    
    func setupLayout() {
        view.addSubview(imageView)
        imageView.anchor(top: view.topAnchor, bottom: view.bottomAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor, marginTop: 297, marginBottom: -497, marginLeading: 128, marginTrailing: -128, width: 0, height: 0, centerX: nil, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
        
        view.addSubview(pageTitle)
        pageTitle.anchor(top: imageView.bottomAnchor, bottom: nil, leading: nil, trailing: nil, marginTop: 132, marginBottom: 0, marginLeading: 0, marginTrailing: 0, width: 180, height: 41, centerX: view.centerXAnchor, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
        
        view.addSubview(descriptionTitle)
        descriptionTitle.anchor(top: pageTitle.bottomAnchor, bottom: nil, leading: view.leadingAnchor, trailing: view.trailingAnchor, marginTop: 20, marginBottom: 0, marginLeading: 91, marginTrailing: -91, width: 0, height: 0, centerX: nil, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
        
        view.addSubview(pageControl)
        pageControl.anchor(top: descriptionTitle.bottomAnchor, bottom: nil, leading: nil, trailing: nil, marginTop: 34, marginBottom: -202, marginLeading: 172, marginTrailing: -172, width: 70, height: 10, centerX: view.centerXAnchor, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
        
        view.addSubview(nextButton)
        nextButton.anchor(top: pageControl.bottomAnchor, bottom: view.bottomAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor, marginTop: 72, marginBottom: -75, marginLeading: 85, marginTrailing: -85, width: 0, height: 0, centerX: nil, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
    }

}
