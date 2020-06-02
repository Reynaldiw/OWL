//
//  OnboardingViewCell.swift
//  Owl Onboarding
//
//  Created by Mohamad Naufal Nafian on 21/05/20.
//  Copyright © 2020 Mohamad Naufal Nafian. All rights reserved.
//

import UIKit

class OnboardingViewCell: UICollectionViewCell {
    
    
    var page: Page? {
        didSet {
            guard let unwrappedPage = page else { return }

            imageView.image = UIImage(named: unwrappedPage.imageName)
            pageTitle.text = unwrappedPage.headerText
            descriptionTitle.text = unwrappedPage.description
        }
    }
    
    let imageView : UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "OWL-Icon")
        img.contentMode = .scaleAspectFill
        return img
    }()
    
    let pageTitle : UILabel = {
        let label = UILabel()
        label.text = "Welcome to OWL"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()
    
    let descriptionTitle : UILabel = {
        let tv = UILabel()
        tv.text = "An app that allow you to Learn, Explore and Teach each other by your on own learning."
        tv.font = UIFont.systemFont(ofSize: 14)
        tv.numberOfLines = 3
        tv.textAlignment = .center
        
        return tv
    }()

    
    
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        backgroundColor = UIColor.rgb(red: 237, green: 241, blue: 242, alpha: 1)
        //navigationController?.setNavigationBarHidden(true, animated: true)
        setupLayout()
    }
    

    func setupLayout() {
        addSubview(imageView)
        imageView.anchor(top: topAnchor, bottom: bottomAnchor, leading: leadingAnchor, trailing: trailingAnchor, marginTop: 297, marginBottom: -497, marginLeading: 128, marginTrailing: -128, width: 0, height: 0, centerX: nil, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
        
        addSubview(pageTitle)
        pageTitle.anchor(top: imageView.bottomAnchor, bottom: nil, leading: nil, trailing: nil, marginTop: 132, marginBottom: 0, marginLeading: 0, marginTrailing: 0, width: 180, height: 41, centerX: centerXAnchor, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
        
        addSubview(descriptionTitle)
        descriptionTitle.anchor(top: pageTitle.bottomAnchor, bottom: nil, leading: leadingAnchor, trailing: trailingAnchor, marginTop: 20, marginBottom: 0, marginLeading: 91, marginTrailing: -91, width: 0, height: 0, centerX: nil, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
        
//        addSubview(pageControl)
//        pageControl.anchor(top: descriptionTitle.bottomAnchor, bottom: nil, leading: nil, trailing: nil, marginTop: 34, marginBottom: -202, marginLeading: 172, marginTrailing: -172, width: 70, height: 10, centerX: centerXAnchor, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
//
//        addSubview(nextButton)
//        nextButton.anchor(top: pageControl.bottomAnchor, bottom: bottomAnchor, leading: leadingAnchor, trailing: trailingAnchor, marginTop: 72, marginBottom: -75, marginLeading: 85, marginTrailing: -85, width: 0, height: 0, centerX: nil, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
    }
    
    
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
