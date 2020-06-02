//
//  InterestCell.swift
//  owl
//
//  Created by Reynaldi Wijaya on 25/05/20.
//  Copyright © 2020 Reynaldi Wijaya. All rights reserved.
//

import UIKit

class MenuCell: UICollectionViewCell {
    
    let contentMenuView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.setCellShadow()
        return view
    }()
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10)
        label.textColor = Colors.bluePrimaryColor
        label.numberOfLines = 2
        label.textAlignment = .center
        return label
    }()
    
    var model: MenuModel? {
        didSet {
            updateUI()
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addViews()
        setupConstraints()
        
    }
    
    func addViews() {
        self.addSubview(contentMenuView)
        contentMenuView.addSubview(imageView)
        contentMenuView.addSubview(titleLabel)
    }
    
    func setupConstraints() {
        contentMenuView.anchor(top: self.topAnchor, bottom: self.bottomAnchor, leading: self.leadingAnchor, trailing: self.trailingAnchor, marginTop: 0, marginBottom: 0, marginLeading: 0, marginTrailing: 0, width: 0, height: 0, centerX: nil, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
        
        imageView.anchor(top: nil, bottom: nil, leading: nil, trailing: nil, marginTop: 0, marginBottom: 0, marginLeading: 0, marginTrailing: 0, width: 35, height: 35, centerX: contentMenuView.centerXAnchor, centerY: contentMenuView.centerYAnchor, marginFromCenterX: 0, marginFromCenterY: -10)
        
        titleLabel.anchor(top: imageView.bottomAnchor, bottom: nil, leading: self.leadingAnchor, trailing: self.trailingAnchor, marginTop: 8, marginBottom: 0, marginLeading: 5, marginTrailing: -5, width: 0, height: 0, centerX: contentMenuView.centerXAnchor, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
    }
    
    func updateUI() {
        imageView.image = model?.imagePosterView
        titleLabel.text = model?.title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
