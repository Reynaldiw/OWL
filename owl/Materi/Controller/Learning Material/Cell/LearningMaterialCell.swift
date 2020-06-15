//
//  LearningMaterialCell.swift
//  owl
//
//  Created by Reynaldi Wijaya on 15/06/20.
//  Copyright © 2020 Reynaldi Wijaya. All rights reserved.
//

import UIKit

class LearningMaterialCell: UICollectionViewCell {
    
    var learningMaterialModel: LearningMaterialModel? {
        didSet {
            updateUI()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        layer.cornerRadius = 10
        setCellShadow()
        
        setupViews()
        setupConstraints()
    }
    
    fileprivate func setupViews() {
        self.addSubview(imageView)
        self.addSubview(stackEndView)
        stackEndView.addArrangedSubview(imageCheckView)
        stackEndView.addArrangedSubview(imageBookmarkView)
        self.addSubview(viewOfContentMateri)
        viewOfContentMateri.addSubview(titleMateriLabel)
        viewOfContentMateri.addSubview(seenAndRatingView)
        seenAndRatingView.addSubview(imageSeenView)
        seenAndRatingView.addSubview(totalSeenLabel)
        self.addSubview(writerView)
        writerView.addSubview(imageWriterView)
        writerView.addSubview(writerNameLabel)
    }
    
    fileprivate func setupConstraints() {
        setupImageViewConstraint()
        setupStackEndViewConstraint()
        setupImageCheckConstraint()
        setupViewOfContentMateriConstraint()
        setupTitleMateriConstraint()
        setupSeenAndRatingConstraint()
        setupImageSeenConstraint()
        setupTotalSeenLabelConstraint()
        setupWriterViewConstraint()
        setupImageWriterConstraint()
        setupWriterNameConstraint()
    }
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        return imageView
    }()
    
    fileprivate func setupImageViewConstraint() {
        imageView.anchor(top: self.topAnchor, bottom: self.bottomAnchor, leading: self.leadingAnchor, trailing: nil, marginTop: 0, marginBottom: 0, marginLeading: 0, marginTrailing: 0, width: 45, height: 0, centerX: nil, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
    }
    
    lazy var stackEndView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 8
        return stackView
    }()
    
    fileprivate func setupStackEndViewConstraint() {
        stackEndView.anchor(top: self.topAnchor, bottom: self.bottomAnchor, leading: nil, trailing: self.trailingAnchor, marginTop: 3, marginBottom: 3, marginLeading: 0, marginTrailing: 8, width: 17, height: 0, centerX: nil, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
    }
    
    lazy var imageCheckView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    fileprivate func setupImageCheckConstraint() {
        imageCheckView.heightAnchor.constraint(equalToConstant: 17).isActive = true
    }
    
    lazy var imageBookmarkView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    lazy var viewOfContentMateri: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    fileprivate func setupViewOfContentMateriConstraint() {
        viewOfContentMateri.anchor(top: self.topAnchor, bottom: self.bottomAnchor, leading: imageView.trailingAnchor, trailing: stackEndView.leadingAnchor, marginTop: 5, marginBottom: -3, marginLeading: 15, marginTrailing: -5, width: 0, height: 0, centerX: nil, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
    }
    
    lazy var titleMateriLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13)
        label.textColor = .black
        return label
    }()
    
    fileprivate func setupTitleMateriConstraint() {
        titleMateriLabel.anchor(top: viewOfContentMateri.topAnchor, bottom: nil, leading: viewOfContentMateri.leadingAnchor, trailing: viewOfContentMateri.trailingAnchor, marginTop: 0, marginBottom: 0, marginLeading: 0, marginTrailing: 0, width: 0, height: 0, centerX: nil, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
    }
    
    lazy var seenAndRatingView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    fileprivate func setupSeenAndRatingConstraint() {
        seenAndRatingView.anchor(top: titleMateriLabel.bottomAnchor, bottom: nil, leading: viewOfContentMateri.leadingAnchor, trailing: viewOfContentMateri.trailingAnchor, marginTop: 0, marginBottom: 0, marginLeading: 0, marginTrailing: 0, width: 0, height: 15, centerX: nil, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
    }
    
    lazy var imageSeenView: UIImageView = {
        let imageview = UIImageView()
        imageview.image = UIImage(named: "eye")
        return imageview
    }()
    
    fileprivate func setupImageSeenConstraint() {
        imageSeenView.anchor(top: nil, bottom: nil, leading: seenAndRatingView.leadingAnchor, trailing: nil, marginTop: 0, marginBottom: 0, marginLeading: 0, marginTrailing: 0, width: 9, height: 6, centerX: nil, centerY: seenAndRatingView.centerYAnchor, marginFromCenterX: 0, marginFromCenterY: 0)
    }
    
    lazy var totalSeenLabel: UILabel = {
        let label = UILabel()
        label.font = .italicSystemFont(ofSize: 8)
        return label
    }()
    
    fileprivate func setupTotalSeenLabelConstraint() {
        totalSeenLabel.anchor(top: nil, bottom: nil, leading: imageSeenView.trailingAnchor, trailing: nil, marginTop: 0, marginBottom: 0, marginLeading: 8, marginTrailing: 0, width: 100, height: 0, centerX: nil, centerY: seenAndRatingView.centerYAnchor, marginFromCenterX: 0, marginFromCenterY: 0)
    }
    
    lazy var writerView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    fileprivate func setupWriterViewConstraint() {
        writerView.anchor(top: seenAndRatingView.bottomAnchor, bottom: viewOfContentMateri.bottomAnchor, leading: viewOfContentMateri.leadingAnchor, trailing: viewOfContentMateri.trailingAnchor, marginTop: 0, marginBottom: 0, marginLeading: 0, marginTrailing: 0, width: 0, height: 0, centerX: nil, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
    }
    
    lazy var imageWriterView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 6
        return imageView
    }()
    
    fileprivate func setupImageWriterConstraint() {
        imageWriterView.anchor(top: nil, bottom: nil, leading: writerView.leadingAnchor, trailing: nil, marginTop: 0, marginBottom: 0, marginLeading: 0, marginTrailing: 0, width: 12, height: 12, centerX: nil, centerY: writerView.centerYAnchor, marginFromCenterX: 0, marginFromCenterY: 0)
    }
    
    lazy var writerNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 8)
        return label
    }()
    
    fileprivate func setupWriterNameConstraint() {
        writerNameLabel.anchor(top: nil, bottom: nil, leading: imageWriterView.trailingAnchor, trailing: writerView.trailingAnchor, marginTop: 0, marginBottom: 0, marginLeading: 8, marginTrailing: 8, width: 0, height: 0, centerX: nil, centerY: writerView.centerYAnchor, marginFromCenterX: 0, marginFromCenterY: 0)
    }
    
    fileprivate func updateUI() {
        if learningMaterialModel?.isDone ?? false {
            imageCheckView.image = UIImage(named: "check")
        } else {
            imageCheckView.image = UIImage()
        }
        if learningMaterialModel?.isBookmark ?? false {
            imageBookmarkView.image = UIImage(named: "bookmarkIcon")
        } else {
            imageBookmarkView.image = UIImage()
        }
        titleMateriLabel.text = learningMaterialModel?.title
        if let totalSeen = learningMaterialModel?.totalSeen {
            totalSeenLabel.text = "\(totalSeen) seen"
        }
        imageWriterView.image = learningMaterialModel?.imageViewProfileWriter
        imageView.image = learningMaterialModel?.imageViewPoster
        writerNameLabel.text = learningMaterialModel?.writer
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
