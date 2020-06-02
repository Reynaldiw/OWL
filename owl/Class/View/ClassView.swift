//
//  DashboardView.swift
//  owl
//
//  Created by Reynaldi Wijaya on 24/05/20.
//  Copyright © 2020 Reynaldi Wijaya. All rights reserved.
//

import UIKit

class ClassView: UIView {
    
    let popularLiveClassView = LiveClassView()
    let popularProjectView = ProjectView()
    
    let screenSize = UIScreen.main.bounds
    
    // Add Scroll View
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = Colors.greyColorBackground
        return scrollView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
        
        popularLiveClassView.headerView.titleLabel.text = "Most Popular Live Class"
        popularProjectView.headerView.titleLabel.text = "Most Popular Project"
        
    }
    
    fileprivate func setupViews() {
        self.addSubview(scrollView)
        scrollView.contentSize = CGSize(width: frame.width, height: 1000)
        scrollView.addSubview(imageClassView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(subTitleLabel)
        scrollView.addSubview(stackView)
        scrollView.addSubview(menuCollectionView)
        scrollView.addSubview(popularProjectView)
        scrollView.addSubview(popularLiveClassView)
    }
    
    fileprivate func setupConstraints() {
        setupScrollViewConstraint()
        setupImageDashboardConstraint()
        setupStackViewConstraint()
        setupMenuCVConstraint()
        setupPopularProjectViewConstraint()
        setupPopularLiveClassConstraint()
    }
    
    fileprivate func setupScrollViewConstraint() {
        scrollView.anchor(top: topAnchor, bottom: bottomAnchor, leading: leadingAnchor, trailing: trailingAnchor, marginTop: 0, marginBottom: 0, marginLeading: 0, marginTrailing: 0, width: 0, height: 0, centerX: nil, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
    }
    
    // Add Image View
    let imageClassView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "illustrationClass")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    fileprivate func setupImageDashboardConstraint() {
        imageClassView.anchor(top: scrollView.topAnchor, bottom: nil, leading: nil, trailing: nil, marginTop: 30, marginBottom: 0, marginLeading: 0, marginTrailing: 0, width: 0, height: 112, centerX: scrollView.centerXAnchor, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
    }
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 5
        return stackView
    }()
    
    // Add Title and Sub Title
    let titleLabel: UILabel = {
        let title = UILabel()
        title.text = "Hi Student"
        title.textColor = .black
        title.font = UIFont.boldSystemFont(ofSize: 21)
        title.textAlignment = .center
        return title
    }()
    
    let subTitleLabel: UILabel = {
        let title = UILabel()
        title.text = "Which Class You Wanna Join Today ?"
        title.textColor = .black
        title.font = UIFont.systemFont(ofSize: 15)
        title.textAlignment = .center
        title.numberOfLines = 2
        return title
    }()
    
    fileprivate func setupStackViewConstraint() {
        stackView.anchor(top: imageClassView.bottomAnchor, bottom: nil, leading: nil, trailing: nil, marginTop: 18, marginBottom: 0, marginLeading: 0, marginTrailing: 0, width: 180, height: 0, centerX: scrollView.centerXAnchor, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
    }
    
    // Add Menu Collection View
    let menuCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.sectionInset = UIEdgeInsets(top: 5, left: 30, bottom: 5, right: 30)
        flowLayout.minimumInteritemSpacing = 10
        flowLayout.minimumLineSpacing = 10
    
        let cv = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        cv.backgroundColor = .clear
        cv.showsHorizontalScrollIndicator = false
        return cv
    }()
    
    fileprivate func setupMenuCVConstraint() {
        menuCollectionView.anchor(top: stackView.bottomAnchor, bottom: nil, leading: scrollView.leadingAnchor, trailing: scrollView.trailingAnchor, marginTop: 15, marginBottom: 0, marginLeading: 0, marginTrailing: 0, width: screenSize.width, height: 90, centerX: nil, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
    }
    
    fileprivate func setupPopularProjectViewConstraint() {
        popularProjectView.anchor(top: menuCollectionView.bottomAnchor, bottom: nil, leading: scrollView.leadingAnchor, trailing: scrollView.trailingAnchor, marginTop: 20, marginBottom: 20, marginLeading: 0, marginTrailing: 0, width: 0, height: 200, centerX: nil, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
    }
    
    fileprivate func setupPopularLiveClassConstraint() {
        popularLiveClassView.anchor(top: popularProjectView.bottomAnchor, bottom: nil, leading: scrollView.leadingAnchor, trailing: scrollView.trailingAnchor, marginTop: 30, marginBottom: 0, marginLeading: 0, marginTrailing: 0, width: 0, height: 125, centerX: nil, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
