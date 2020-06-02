//
//  DiscussionForum.swift
//  Owl Onboarding
//
//  Created by Mohamad Naufal Nafian on 02/06/20.
//  Copyright © 2020 Mohamad Naufal Nafian. All rights reserved.
//

import UIKit

class DiscussionForumCell : UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

    let cellId = "cellId"
//
    let collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 12
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        return cv
    }()
    
    let titleLabel : UILabel = {
        let label = UILabel()
        label.text = "Most popular project"
        label.textColor = UIColor.rgb(red: 16, green: 120, blue: 149, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 13)
        return label
        
    }()
    
    let rectangle : UIView = {
        let rec = UIView()
        rec.backgroundColor = UIColor.rgb(red: 16, green: 120, blue: 149, alpha: 1)
        return rec
    }()
    
     override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
        }
    
    func setupCell() {
        backgroundColor = .clear
        addSubview(collectionView)
        collectionView.anchor(top: topAnchor, bottom: bottomAnchor, leading: leadingAnchor, trailing: trailingAnchor, marginTop: 30, marginBottom: -4, marginLeading: 0, marginTrailing: 0, width: 0, height: 0, centerX: nil, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)

        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(myPresent.self , forCellWithReuseIdentifier: cellId)
        collectionView.showsHorizontalScrollIndicator = false
        
        addSubview(rectangle)
        rectangle.anchor(top: topAnchor, bottom: nil, leading: leadingAnchor, trailing: nil, marginTop: 0, marginBottom: 0, marginLeading: 0, marginTrailing: 0, width: 3, height: 20, centerX: nil, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
        
        addSubview(titleLabel)
        titleLabel.anchor(top: topAnchor, bottom: nil, leading: rectangle.leadingAnchor, trailing: nil, marginTop: 3, marginBottom: 0, marginLeading: 6, marginTrailing: 0, width: 0, height: 0, centerX: nil, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
//
//
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        6
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! myPresent
        return cell
    }
//
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 172, height: 172)
    }
//
    
    
//
     private class myPresent : UICollectionViewCell {
        
        let container : UIView = {
            let ctnr = UIView()
            ctnr.backgroundColor = .white
            ctnr.layer.cornerRadius = 10
            //ctnr.layer.shadowColor = CGColor.rgb(red: 0, green: 0, blue: 0, alpha: 1)
            ctnr.layer.applySketchShadow(color: .black, alpha: 0.11, x: -1, y: 2, blur: 3, spread: 0)
            
            return ctnr
        }()
        
        let imageContainer : UIView = {
            let ctnr = UIView()
            ctnr.backgroundColor = .lightGray
            ctnr.layer.cornerRadius = 10
            return ctnr
        }()
        
        let image : UIImageView = {
            let image = UIImageView()
            image.image = UIImage(named: "AR")
            image.contentMode = .scaleToFill
            
            return image
        }()
        
        let projectTitle : UILabel = {
            let label = UILabel()
            label.text = "Make simple Augmented Reality app using Swift"
            label.textColor = .black
            label.numberOfLines = 2
            label.font = UIFont.systemFont(ofSize: 11)
            return label
        }()
        
        let tagLabel : UILabel = {
            let label = UILabel()
            label.text = "#1 in Coding Swift"
            label.textColor = UIColor.rgb(red: 16, green: 120, blue: 149, alpha: 1)
            label.font = UIFont.systemFont(ofSize: 8)
            return label
        }()
        
        let engageButton : UIButton = {
            let btn = UIButton()
            btn.backgroundColor = UIColor.rgb(red: 16, green: 120, blue: 149, alpha: 1)
            btn.setTitle("ENGAGE", for: .normal)
            btn.titleLabel?.textColor = .white
            btn.titleLabel?.font = UIFont.systemFont(ofSize: 10)
            btn.layer.cornerRadius = 8
            
            return btn
        }()

        override init(frame: CGRect) {
            super.init(frame:frame)
            backgroundColor = .clear
            setupInside()
        }
        
        func setupInside() {
            addSubview(container)
            container.anchor(top: nil, bottom: nil, leading: nil, trailing: nil, marginTop: 0, marginBottom: 0, marginLeading: 0, marginTrailing: 0, width: 170, height: 170, centerX: centerXAnchor, centerY: centerYAnchor, marginFromCenterX: 0, marginFromCenterY: 0)
            
            addSubview(imageContainer)
            imageContainer.anchor(top: container.topAnchor, bottom: nil, leading: container.leadingAnchor, trailing: container.trailingAnchor, marginTop: 0, marginBottom: 0, marginLeading: 0, marginTrailing: 0, width: 0, height: 115, centerX: nil, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
            
            addSubview(image)
            image.anchor(top: imageContainer.topAnchor, bottom: imageContainer.bottomAnchor, leading: imageContainer.leadingAnchor, trailing: imageContainer.trailingAnchor, marginTop: 0, marginBottom: 0, marginLeading: 0, marginTrailing: 0, width: 0, height: 0, centerX: nil, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
            
            addSubview(projectTitle)
            projectTitle.anchor(top: imageContainer.bottomAnchor, bottom: nil, leading: container.leadingAnchor, trailing: container.trailingAnchor, marginTop: 4, marginBottom: 0, marginLeading: 6, marginTrailing: -6, width: 0, height: 0, centerX: nil, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
            
            addSubview(tagLabel)
            tagLabel.anchor(top: projectTitle.bottomAnchor, bottom: nil, leading: container.leadingAnchor, trailing: nil, marginTop: 8, marginBottom: 0, marginLeading: 6, marginTrailing: 0, width: 0, height: 0, centerX: nil, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
            
            addSubview(engageButton)
            engageButton.anchor(top: nil, bottom: container.bottomAnchor, leading: nil, trailing: container.trailingAnchor, marginTop: 0, marginBottom: -6, marginLeading: 0, marginTrailing: -6, width: 54, height: 18, centerX: nil, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
        }
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
    

}




