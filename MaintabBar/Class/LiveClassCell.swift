//
//  LiveClassCell.swift
//  Owl Onboarding
//
//  Created by Mohamad Naufal Nafian on 02/06/20.
//  Copyright © 2020 Mohamad Naufal Nafian. All rights reserved.
//

import UIKit

class LiveClassCell : UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

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
        label.text = "Most popular live class"
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
        return CGSize(width: 280, height: 100)
    }
//
    
    
//
     private class myPresent : UICollectionViewCell {
        
        let image : UIImageView = {
            let image = UIImageView()
            image.image = UIImage(named: "imagepopularclass1")
            image.contentMode = .scaleToFill
            
            return image
        }()
        
        let titleLabel : UILabel = {
            let label = UILabel()
            label.text = "Connect ML to Core Data"
            label.textColor = .black
            label.font = UIFont.boldSystemFont(ofSize: 13)
            return label
        }()
        
        let tagLabel : UILabel = {
            let label = UILabel()
            label.text = "#1 in Coding Swift"
            label.textColor = UIColor.rgb(red: 16, green: 120, blue: 149, alpha: 1)
            label.font = UIFont.systemFont(ofSize: 8)
            return label
        }()
        
        let authorLabel : UILabel = {
            let label = UILabel()
            label.text = "Asep Mulyana"
            label.textColor = .black
            label.font = UIFont.systemFont(ofSize: 10)
            return label
        }()
        
        let joinButton : UIButton = {
            let btn = UIButton()
            btn.backgroundColor = UIColor.rgb(red: 16, green: 120, blue: 149, alpha: 1)
            btn.setTitle("JOIN", for: .normal)
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
            addSubview(image)
            image.anchor(top: nil, bottom: nil, leading: leadingAnchor, trailing: nil, marginTop: 0, marginBottom: 0, marginLeading: 0, marginTrailing: 0, width: 90, height: 90, centerX: nil, centerY: centerYAnchor, marginFromCenterX: 0, marginFromCenterY: 0)
            
            addSubview(titleLabel)
            titleLabel.anchor(top: topAnchor, bottom: nil, leading: image.trailingAnchor, trailing: nil, marginTop: 20, marginBottom: 0, marginLeading: 10, marginTrailing: 0, width: 0, height: 0, centerX: nil, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
            
            addSubview(tagLabel)
            tagLabel.anchor(top: nil, bottom: titleLabel.topAnchor, leading: image.trailingAnchor, trailing: nil, marginTop: 0, marginBottom: 0, marginLeading: 10, marginTrailing: 0, width: 0, height: 0, centerX: nil, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
            
            addSubview(authorLabel)
            authorLabel.anchor(top: titleLabel.bottomAnchor, bottom: nil, leading: image.trailingAnchor, trailing: nil, marginTop: 3, marginBottom: 0, marginLeading: 10, marginTrailing: 0, width: 0, height: 0, centerX: nil, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
            
            addSubview(joinButton)
            joinButton.anchor(top: authorLabel.bottomAnchor, bottom: nil, leading: image.trailingAnchor, trailing: nil, marginTop: 18, marginBottom: 0, marginLeading: 10, marginTrailing: 0, width: 54, height: 18, centerX: nil, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
            
            
            
        }
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
    

}




