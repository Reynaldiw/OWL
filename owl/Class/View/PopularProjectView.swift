//
//  ProjectView.swift
//  owl
//
//  Created by Reynaldi Wijaya on 02/06/20.
//  Copyright © 2020 Reynaldi Wijaya. All rights reserved.
//

import UIKit

class PopularProjectView: UIView {
    
    let headerView = HeaderCollectionView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        self.addSubview(headerView)
        self.addSubview(projectCV)
    }
    
    func setupConstraints() {
        setupHeaderConstraint()
        setupProjectCVConstraint()
    }
    
    func setupHeaderConstraint() {
        headerView.anchor(top: self.topAnchor, bottom: nil, leading: self.leadingAnchor, trailing: self.trailingAnchor, marginTop: 0, marginBottom: 0, marginLeading: 30, marginTrailing: 30, width: 0, height: 0, centerX: nil, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
    }
    
    let projectCV: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 30)
        flowLayout.minimumInteritemSpacing = 13
        flowLayout.minimumLineSpacing = 13
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        cv.backgroundColor = .clear
        cv.showsHorizontalScrollIndicator = false
        return cv
    }()
    
    fileprivate func setupProjectCVConstraint() {
        projectCV.anchor(top: headerView.bottomAnchor, bottom: self.bottomAnchor, leading: self.leadingAnchor, trailing: self.trailingAnchor, marginTop: 10, marginBottom: 10, marginLeading: 0, marginTrailing: 0, width: 0, height: 180, centerX: nil, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
