//
//  ListMateriCellCollectionViewCell.swift
//  owl
//
//  Created by Reynaldi Wijaya on 14/06/20.
//  Copyright © 2020 Reynaldi Wijaya. All rights reserved.
//

import UIKit

class ListMateriCell: UICollectionViewCell {
    
    var categoryModel: CategoryMateriModel? {
        didSet {
            self.updateUI()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
    }
    
    fileprivate func setupViews() {
        self.addSubview(contentMateriView)
        contentMateriView.addSubview(stackView)
        stackView.addArrangedSubview(imageCheckView)
        stackView.addArrangedSubview(titleMateriLabel)
        stackView.addArrangedSubview(stackLiveView)
        stackLiveView.addArrangedSubview(circleView)
        stackLiveView.addArrangedSubview(liveLabel)
        contentMateriView.addSubview(bookmarkImageView)
    }
    
    fileprivate func setupConstraints() {
        setupContentMateriViewConstraint()
        setupStackViewConstraint()
        setupImageCheckConstraint()
        setupTitleMateriConstraint()
        setupStackLiveConstraint()
        setupSizeOfCircle()
        setupBookmarkImageConstraint()
    }
    
    lazy var contentMateriView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.setCellShadow()
        return view
    }()
    
    fileprivate func setupContentMateriViewConstraint() {
        contentMateriView.anchor(top: self.topAnchor, bottom: self.bottomAnchor, leading: self.leadingAnchor, trailing: self.trailingAnchor, marginTop: 0, marginBottom: 0, marginLeading: 0, marginTrailing: 0, width: 0, height: 0, centerX: nil, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
    }
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 8
        return stackView
    }()
    
    fileprivate func setupStackViewConstraint() {
        stackView.anchor(top: contentMateriView.topAnchor, bottom: contentMateriView.bottomAnchor, leading: contentMateriView.leadingAnchor, trailing: bookmarkImageView.leadingAnchor, marginTop: 0, marginBottom: 0, marginLeading: 8, marginTrailing: -8, width: contentMateriView.frame.width, height: 0, centerX: nil, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
    }
    
    lazy var imageCheckView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    fileprivate func setupImageCheckConstraint() {
        imageCheckView.anchor(top: stackView.topAnchor, bottom: stackView.bottomAnchor, leading: stackView.leadingAnchor, trailing: nil, marginTop: 5, marginBottom: -5, marginLeading: 5, marginTrailing: 0, width: 17, height: 17, centerX: nil, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
    }
    
    lazy var titleMateriLabel: UILabel = {
        let label = UILabel()
        label.text = "Basic Of Code"
        label.textColor = .black
        label.font = .systemFont(ofSize: 12)
        return label
    }()
    
    fileprivate func setupTitleMateriConstraint() {
        titleMateriLabel.anchor(top: stackView.topAnchor, bottom: stackView.bottomAnchor, leading: nil, trailing: nil, marginTop: 0, marginBottom: 0, marginLeading: 0, marginTrailing: 0, width: 0, height: 0, centerX: nil, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
    }
    
    lazy var stackLiveView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 5
        return stackView
    }()
    
    fileprivate func setupStackLiveConstraint() {
        stackLiveView.anchor(top: stackView.topAnchor, bottom: stackView.bottomAnchor, leading: nil, trailing: nil, marginTop: 5, marginBottom: -5, marginLeading: 0, marginTrailing: 0, width: 0, height: 0, centerX: nil, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
    }
    
    lazy var circleView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        return view
    }()
    
    fileprivate func setupSizeOfCircle() {
        circleView.widthAnchor.constraint(equalToConstant: 10).isActive = true
        circleView.heightAnchor.constraint(equalToConstant: 10).isActive = true
        circleView.layer.cornerRadius = circleView.frame.width / 2
    }
    
    lazy var bookmarkImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "bookmarkIcon")
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    fileprivate func setupBookmarkImageConstraint() {
        bookmarkImageView.anchor(top: contentMateriView.topAnchor, bottom: nil, leading: stackView.trailingAnchor, trailing: contentMateriView.trailingAnchor, marginTop: 0, marginBottom: 0, marginLeading: 5, marginTrailing: -15, width: 15, height: 26, centerX: nil, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
    }
    
    lazy var liveLabel: UILabel = {
        let label = UILabel()
        label.text = "Live Expert"
        label.textColor = UIColor(red: 0.52, green: 0.52, blue: 0.52, alpha: 1.00)
        label.font = .systemFont(ofSize: 13)
        return label
    }()
    
    fileprivate func updateUI() {
        titleMateriLabel.text = categoryModel?.title
        if categoryModel?.isLive ?? false {
            stackLiveView.isHidden = false
        } else {
            stackLiveView.isHidden = true
        }
        if categoryModel?.isDone ?? false {
            imageCheckView.image = UIImage(named: "check")
        } else {
            imageCheckView.image = UIImage()
        }
        if categoryModel?.isBookmark ?? false {
            bookmarkImageView.isHidden = false
        }else {
            bookmarkImageView.isHidden = true
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
