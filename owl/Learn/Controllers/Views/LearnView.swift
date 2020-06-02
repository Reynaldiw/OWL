//
//  LearnView.swift
//  owl
//
//  Created by Reynaldi Wijaya on 02/06/20.
//  Copyright © 2020 Reynaldi Wijaya. All rights reserved.
//

import UIKit

class LearnView: UIView {
    
    var frameWidth: CGFloat?

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = Colors.greyColorBackground
        
        frameWidth = frame.width
        
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        self.addSubview(learnCV)
    }
    
    func setupConstraints() {
        setupLearnCVConstraint()
    }
    
    lazy var learnCV: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.headerReferenceSize = CGSize(width: self.frameWidth!, height: 35)
        flowLayout.sectionInset = UIEdgeInsets(top: 8, left: 30, bottom: 15, right: 30)
        flowLayout.minimumInteritemSpacing = 10
        flowLayout.minimumLineSpacing = 10
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        cv.backgroundColor = .clear
        return cv
    }()
    
    fileprivate func setupLearnCVConstraint() {
        learnCV.anchor(top: self.safeAreaLayoutGuide.topAnchor, bottom: self.bottomAnchor, leading: self.leadingAnchor, trailing: self.trailingAnchor, marginTop: 30, marginBottom: 0, marginLeading: 0, marginTrailing: 0, width: 0, height: 0, centerX: nil, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
