//
//  PopularProjectCell.swift
//  Owl Onboarding
//
//  Created by Mohamad Naufal Nafian on 02/06/20.
//  Copyright © 2020 Mohamad Naufal Nafian. All rights reserved.
//

import UIKit

class PopularProjectCell : UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

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
        label.text = "Top Discussion Forum"
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
        collectionView.anchor(top: topAnchor, bottom: bottomAnchor, leading: leadingAnchor, trailing: trailingAnchor, marginTop: 26, marginBottom: -4, marginLeading: 0, marginTrailing: 0, width: 0, height: 0, centerX: nil, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)

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
        return CGSize(width: 280, height: 70)
    }
//
    
    
//
     private class myPresent : UICollectionViewCell {
        
        let container : UIView = {
            let ctnr = UIView()
            ctnr.backgroundColor = .white
            ctnr.layer.cornerRadius = 8
            //ctnr.layer.shadowColor = CGColor.rgb(red: 0, green: 0, blue: 0, alpha: 1)
            ctnr.layer.applySketchShadow(color: .black, alpha: 0.11, x: -1, y: 2, blur: 3, spread: 0)
            
            return ctnr
        }()
        
        let imagesLogo : UIImageView = {
            let image = UIImageView()
            image.image = UIImage(named: "swift")
            image.contentMode = .scaleAspectFit
            return image
        }()
        
        let discussionTopic : UILabel = {
            let label = UILabel()
            label.text = "Got some stuck what kind Ios framework that match when make education app?"
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
        
        let replyButton : UIButton = {
            let btn = UIButton()
            btn.backgroundColor = UIColor.rgb(red: 16, green: 120, blue: 149, alpha: 1)
            btn.setTitle("REPLY", for: .normal)
            btn.titleLabel?.textColor = .white
            btn.titleLabel?.font = UIFont.systemFont(ofSize: 10)
            btn.layer.cornerRadius = 8
            
            return btn
        }()
        
        let replyCount : UILabel = {
            let label = UILabel()
            label.text = "124 reply"
            label.textColor = .lightGray
            label.font = UIFont.systemFont(ofSize: 8)
            return label
        }()

        override init(frame: CGRect) {
            super.init(frame:frame)
            backgroundColor = .clear
            setupInside()
        }
        
        func setupInside() {
            addSubview(container)
            container.anchor(top: nil, bottom: nil, leading: leadingAnchor, trailing: nil, marginTop: 0, marginBottom: 0, marginLeading: 0, marginTrailing: 0, width: 64, height: 64, centerX: nil, centerY: centerYAnchor, marginFromCenterX: 0, marginFromCenterY: 0)
            
            addSubview(imagesLogo)
            imagesLogo.anchor(top: nil, bottom: nil, leading: nil, trailing: nil, marginTop: 0, marginBottom: 0, marginLeading: 0, marginTrailing: 0, width: 40, height: 40, centerX: container.centerXAnchor, centerY: container.centerYAnchor, marginFromCenterX: 0, marginFromCenterY: 0)
            
            addSubview(discussionTopic)
            discussionTopic.anchor(top: topAnchor, bottom: nil, leading: container.trailingAnchor, trailing: trailingAnchor, marginTop: 13, marginBottom: 0, marginLeading: 4, marginTrailing: -4, width: 0, height: 0, centerX: nil, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
            
            addSubview(tagLabel)
            tagLabel.anchor(top: nil, bottom: discussionTopic.topAnchor, leading: container.trailingAnchor, trailing: nil, marginTop: 0, marginBottom: 0, marginLeading: 4, marginTrailing: 0, width: 0, height: 0, centerX: nil, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
            
            addSubview(replyButton)
            replyButton.anchor(top: discussionTopic.bottomAnchor, bottom: nil, leading: nil, trailing: trailingAnchor, marginTop: 4, marginBottom: 0, marginLeading: 0, marginTrailing: -4, width: 54, height: 18, centerX: nil, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
            
            addSubview(replyCount)
            replyCount.anchor(top: discussionTopic.bottomAnchor, bottom: nil, leading: container.trailingAnchor, trailing: nil, marginTop: 6, marginBottom: 0, marginLeading: 4, marginTrailing: 0, width: 0, height: 0, centerX: nil, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
            
            
        }
        
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
    

}



