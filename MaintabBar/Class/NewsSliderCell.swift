//
//  NewsSliderCell.swift
//  Owl Onboarding
//
//  Created by Mohamad Naufal Nafian on 02/06/20.
//  Copyright © 2020 Mohamad Naufal Nafian. All rights reserved.
//

import UIKit

class NewsSliderCell: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

    let cellId = "cellId"
//
    let collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 6
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        return cv
    }()
    
     override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
        }
    
    func setupCell() {
        backgroundColor = .clear
        addSubview(collectionView)
        collectionView.anchor(top: topAnchor, bottom: bottomAnchor, leading: leadingAnchor, trailing: trailingAnchor, marginTop: 4, marginBottom: -4, marginLeading: 0, marginTrailing: 0, width: 0, height: 0, centerX: nil, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)

        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(myPresent.self , forCellWithReuseIdentifier: cellId)
        collectionView.showsHorizontalScrollIndicator = false
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
        return CGSize(width: 324, height: 190)
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
            ctnr.backgroundColor = .clear
            ctnr.layer.cornerRadius = 10
            return ctnr
        }()
        
        let image : UIImageView = {
            let image = UIImageView()
            image.image = UIImage(named: "dashboardpict")
            image.contentMode = .scaleToFill
            
            return image
        }()
        
        let newsTitle : UILabel = {
            let label = UILabel()
            label.text = "stays healthy and stay safe"
            label.font = UIFont.systemFont(ofSize: 12)
            label.textColor = UIColor.rgb(red: 16, green: 120, blue: 149, alpha: 1)
            
            
            return label
        }()
        
        let learnMore : UILabel = {
            let label = UILabel()
            label.text = "Learn More"
            label.font = UIFont.systemFont(ofSize: 10)
            label.backgroundColor = UIColor.rgb(red: 16, green: 120, blue: 149, alpha: 1)
            label.textColor = UIColor.white
            label.textAlignment = .center
            label.layer.cornerRadius = 6
            return label
        }()


        override init(frame: CGRect) {
            super.init(frame:frame)
            backgroundColor = .clear
            setupInside()
        }
        
        func setupInside() {
            addSubview(container)
            container.anchor(top: nil, bottom: nil, leading: nil, trailing: nil, marginTop: 0, marginBottom: 0, marginLeading: 0, marginTrailing: 0, width: 320, height: 180, centerX: centerXAnchor, centerY: centerYAnchor, marginFromCenterX: 0, marginFromCenterY: 0)
            
            addSubview(imageContainer)
            imageContainer.anchor(top: container.topAnchor, bottom: container.bottomAnchor, leading: container.leadingAnchor, trailing: container.trailingAnchor, marginTop: 0, marginBottom: -40, marginLeading: 0, marginTrailing: 0, width: 0, height: 0, centerX: nil, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
            
            imageContainer.addSubview(image)
            image.anchor(top: imageContainer.topAnchor, bottom: imageContainer.bottomAnchor, leading: imageContainer.leadingAnchor, trailing: imageContainer.trailingAnchor, marginTop: 0, marginBottom: 0, marginLeading: 0, marginTrailing: 0, width: 0, height: 0, centerX: nil, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
            
            addSubview(newsTitle)
            newsTitle.anchor(top: imageContainer.bottomAnchor, bottom: nil, leading: container.leadingAnchor, trailing: nil, marginTop: 12, marginBottom: 0, marginLeading: 14, marginTrailing: 0, width: 0, height: 0, centerX: nil, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
            
            addSubview(learnMore)
            learnMore.anchor(top: imageContainer.bottomAnchor, bottom: nil, leading: nil, trailing: container.trailingAnchor, marginTop: 12, marginBottom: 0, marginLeading: 0, marginTrailing: -10, width: 74, height: 18, centerX: nil, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
            
            
        }
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
    

}



