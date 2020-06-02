//
//  TopMenuCell.swift
//  Owl Onboarding
//
//  Created by Mohamad Naufal Nafian on 02/06/20.
//  Copyright © 2020 Mohamad Naufal Nafian. All rights reserved.
//

import UIKit

class TopMenuCell : UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

    let cellId = "cellId"
//
    let collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 12
        //layout.scrollDirection = .horizontal
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
        collectionView.anchor(top: nil, bottom: nil, leading: nil, trailing: nil, marginTop: 0, marginBottom: 0, marginLeading: 0, marginTrailing: 0, width: 358, height: 82, centerX: centerXAnchor, centerY: centerYAnchor, marginFromCenterX: 0, marginFromCenterY: 0)

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
        4
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! myPresent
        return cell
    }
//
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 82, height: 82)
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
        
        let image : UIImageView = {
            let image = UIImageView()
            image.image = UIImage(named: "forum")
            image.contentMode = .scaleAspectFit
            
            return image
        }()
        
        let title : UILabel = {
            let label = UILabel()
            label.text = "Live Class"
            label.font = UIFont.systemFont(ofSize: 10)
            label.textColor = UIColor.rgb(red: 16, green: 120, blue: 149, alpha: 1)
            
            return label
        }()
        

        override init(frame: CGRect) {
            super.init(frame:frame)
            backgroundColor = .clear
            setupInside()
        }
        
        func setupInside() {
            addSubview(container)
            container.anchor(top: nil, bottom: nil, leading: nil, trailing: nil, marginTop: 0, marginBottom: 0, marginLeading: 0, marginTrailing: 0, width: 82, height: 82, centerX: centerXAnchor, centerY: centerYAnchor, marginFromCenterX: 0, marginFromCenterY: 0)
            
            addSubview(image)
            image.anchor(top: nil, bottom: nil, leading: nil, trailing: nil, marginTop: 0, marginBottom: 0, marginLeading: 0, marginTrailing: 0, width: 40, height: 40, centerX: centerXAnchor, centerY: centerYAnchor, marginFromCenterX: 0, marginFromCenterY: -10)
            
            addSubview(title)
            title.anchor(top: image.bottomAnchor, bottom: nil, leading: nil, trailing: nil, marginTop: 10, marginBottom: 0, marginLeading: 0, marginTrailing: 0, width: 0, height: 0, centerX: centerXAnchor, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
            
        }
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
    

}



