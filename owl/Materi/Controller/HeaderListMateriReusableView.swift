//
//  HeaderListMaterialReusableViewCollectionReusableView.swift
//  owl
//
//  Created by Reynaldi Wijaya on 14/06/20.
//  Copyright © 2020 Reynaldi Wijaya. All rights reserved.
//

import UIKit

class HeaderListMateriReusableView: UICollectionReusableView {
    
    let screenSize = UIScreen.main.bounds
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
    }
    
    fileprivate func setupViews() {
        self.addSubview(imageView)
        self.addSubview(contentOverviewView)
        contentOverviewView.addSubview(overviewLabel)
        self.addSubview(categoryLabel)
    }
    
    fileprivate func setupConstraints() {
        setupImageConstraint()
        setupContentOverviewConstraint()
        setupOverviewConstraint()
        setupCategoryConstraint()
    }
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 10
        imageView.image = UIImage(named: "exampleFoto")
        return imageView
    }()
    
    fileprivate func setupImageConstraint() {
        imageView.anchor(top: self.safeAreaLayoutGuide.topAnchor, bottom: nil, leading: nil, trailing: nil, marginTop: 10, marginBottom: 0, marginLeading: 0, marginTrailing: 0, width: screenSize.width / 1.5, height: 160, centerX: self.centerXAnchor, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
    }
    
    lazy var contentOverviewView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    fileprivate func setupContentOverviewConstraint() {
        contentOverviewView.anchor(top: imageView.bottomAnchor, bottom: nil, leading: self.leadingAnchor, trailing: self.trailingAnchor, marginTop: 15, marginBottom: 0, marginLeading: 0, marginTrailing: 0, width: 0, height: 90, centerX: nil, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
    }
    
    lazy var overviewLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13)
        label.textColor = .black
        label.numberOfLines = 0
        label.text = Constants.DUMMY_OVERVIEW
        return label
    }()
    
    fileprivate func setupOverviewConstraint() {
        overviewLabel.anchor(top: contentOverviewView.topAnchor, bottom: contentOverviewView.bottomAnchor, leading: contentOverviewView.leadingAnchor, trailing: contentOverviewView.trailingAnchor, marginTop: 8, marginBottom: -8, marginLeading: 20, marginTrailing: -20, width: 0, height: 0, centerX: nil, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
    }
    
    lazy var categoryLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 12)
        label.text = "Basic Of Code Categories:"
        return label
    }()
    
    fileprivate func setupCategoryConstraint() {
        categoryLabel.anchor(top: contentOverviewView.bottomAnchor, bottom: self.bottomAnchor, leading: self.leadingAnchor, trailing: self.trailingAnchor, marginTop: 0, marginBottom: 8, marginLeading: 20, marginTrailing: -20, width: 0, height: 0, centerX: nil, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
