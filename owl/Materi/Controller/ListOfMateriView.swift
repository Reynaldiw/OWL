//
//  ListOfMateriView.swift
//  owl
//
//  Created by Reynaldi Wijaya on 13/06/20.
//  Copyright © 2020 Reynaldi Wijaya. All rights reserved.
//

import UIKit

class ListOfMateriView: UIView {
    
    var frameWidth: CGFloat?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = Colors.greyColorBackground
        
        frameWidth = frame.width
        
        setupViews()
        setupConstraints()
    }
    
    fileprivate func setupViews() {
        self.addSubview(materisCollectionView)
    }
    
    fileprivate func setupConstraints() {
        setupMaterisCVConstraint()
    }
    
    lazy var materisCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.headerReferenceSize = CGSize(width: self.frameWidth!, height: 330)
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        flowLayout.minimumInteritemSpacing = 15
        flowLayout.minimumLineSpacing = 15
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        cv.backgroundColor = .clear
        return cv
    }()
    
    fileprivate func setupMaterisCVConstraint() {
        materisCollectionView.anchor(top: self.topAnchor, bottom: self.bottomAnchor, leading: self.leadingAnchor, trailing: self.trailingAnchor, marginTop: 10, marginBottom: 0, marginLeading: 0, marginTrailing: 0, width: 0, height: 0, centerX: nil, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
