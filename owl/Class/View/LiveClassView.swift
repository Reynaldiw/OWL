//
//  LiveClassView.swift
//  owl
//
//  Created by Reynaldi Wijaya on 02/06/20.
//  Copyright © 2020 Reynaldi Wijaya. All rights reserved.
//

import UIKit

class LiveClassView: UIView {
    
    let headerView = HeaderCollectionView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        self.addSubview(headerView)
        self.addSubview(liveClassCV)
    }
    
    func setupConstraints() {
        setupHeaderConstraint()
        setupLiveClassCVConstraint()
    }
    
    func setupHeaderConstraint() {
        headerView.anchor(top: self.topAnchor, bottom: nil, leading: self.leadingAnchor, trailing: self.trailingAnchor, marginTop: 0, marginBottom: 0, marginLeading: 30, marginTrailing: 30, width: 0, height: 0, centerX: nil, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
    }
    
    let liveClassCV: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.sectionInset = UIEdgeInsets(top: 5, left: 30, bottom: 5, right: 30)
        flowLayout.minimumInteritemSpacing = 13
        flowLayout.minimumLineSpacing = 13
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        cv.backgroundColor = .clear
        cv.showsHorizontalScrollIndicator = false
        return cv
    }()
    
    fileprivate func setupLiveClassCVConstraint() {
        liveClassCV.anchor(top: headerView.bottomAnchor, bottom: self.bottomAnchor, leading: self.leadingAnchor, trailing: self.trailingAnchor, marginTop: 8, marginBottom: 10, marginLeading: 0, marginTrailing: 0, width: 0, height: 110, centerX: nil, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
