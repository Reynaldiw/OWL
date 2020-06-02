//
//  ProjectCell.swift
//  owl
//
//  Created by Reynaldi Wijaya on 02/06/20.
//  Copyright © 2020 Reynaldi Wijaya. All rights reserved.
//

import UIKit

class ProjectCell: UICollectionViewCell {
    var model: ProjectModel? {
        didSet {
            updateUI()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setCellShadow()
        
        setupViews()
        setupConstraints()
    }
    
    fileprivate func setupViews() {
        self.addSubview(contentChallengeView)
        contentChallengeView.addSubview(imageBackdropView)
        contentChallengeView.addSubview(informOfChallengeView)
        contentChallengeView.addSubview(titleLabel)
        contentChallengeView.addSubview(topicLabel)
        contentChallengeView.addSubview(engageButton)
    }
    
    fileprivate func setupConstraints() {
        setupContentChallengeViewConstraint()
        setupImageBackdropConstraint()
        setupInformOfChallengeConstraint()
        setupTitleConstraint()
        setupTopicConstraint()
        setupEngageButtonConstraint()
    }
    
    lazy var contentChallengeView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        return view
    }()
    
    fileprivate func setupContentChallengeViewConstraint() {
        contentChallengeView.anchor(top: topAnchor, bottom: bottomAnchor, leading: leadingAnchor, trailing: trailingAnchor, marginTop: 0, marginBottom: 0, marginLeading: 0, marginTrailing: 0, width: 0, height: 0, centerX: contentChallengeView.centerXAnchor, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
    }
    
    
    lazy var imageBackdropView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    fileprivate func setupImageBackdropConstraint() {
        imageBackdropView.anchor(top: contentChallengeView.topAnchor, bottom: nil, leading: contentChallengeView.leadingAnchor, trailing: contentChallengeView.trailingAnchor, marginTop: 0, marginBottom: 0, marginLeading: 0, marginTrailing: 0, width: 0, height: 0, centerX: nil, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
        imageBackdropView.heightAnchor.constraint(equalToConstant: 115).isActive = true
    }

    lazy var informOfChallengeView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    fileprivate func setupInformOfChallengeConstraint() {
        informOfChallengeView.anchor(top: imageBackdropView.bottomAnchor, bottom: contentChallengeView.bottomAnchor, leading: contentChallengeView.leadingAnchor, trailing: contentChallengeView.trailingAnchor, marginTop: 6, marginBottom: -6, marginLeading: 6, marginTrailing: -6, width: 0, height: 0, centerX: nil, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
    }
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 11)
        label.numberOfLines = 2
        return label
    }()
    
    fileprivate func setupTitleConstraint() {
        titleLabel.anchor(top: informOfChallengeView.topAnchor, bottom: nil, leading: informOfChallengeView.leadingAnchor, trailing: informOfChallengeView.trailingAnchor, marginTop: 0, marginBottom: 0, marginLeading: 0, marginTrailing: 0, width: 0, height: 0, centerX: nil, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
    }
    
    let engageButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = Colors.blueSecondaryColor
        button.setTitle("ENGAGE", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 9)
        button.titleLabel?.textColor = .white
        button.layer.cornerRadius = 8
        return button
    }()
    
    fileprivate func setupEngageButtonConstraint() {
        engageButton.anchor(top: nil, bottom: informOfChallengeView.bottomAnchor, leading: nil, trailing: informOfChallengeView.trailingAnchor, marginTop: 0, marginBottom: 0, marginLeading: 0, marginTrailing: 0, width: 55, height: 18, centerX: nil, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
    }
    
    let topicLabel: UILabel = {
        let label = UILabel()
        label.textColor = Colors.blueSecondaryColor
        label.font = .systemFont(ofSize: 10)
        label.numberOfLines = 2
        return label
    }()
    
    fileprivate func setupTopicConstraint() {
        topicLabel.anchor(top: nil, bottom: informOfChallengeView.bottomAnchor, leading: informOfChallengeView.leadingAnchor, trailing: engageButton.leadingAnchor, marginTop: 0, marginBottom: 0, marginLeading: 0, marginTrailing: 3, width: 0, height: 0, centerX: nil, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
    }
    
    func updateUI() {
        imageBackdropView.image = model?.imageView
        titleLabel.text = model?.title
        if let topic = model?.topic, let subTopic = model?.subTopic {
            topicLabel.text = "\(topic) - \(subTopic)"
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
