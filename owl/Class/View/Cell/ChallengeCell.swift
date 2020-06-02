//
//  ChallengeCell.swift
//  owl
//
//  Created by Reynaldi Wijaya on 25/05/20.
//  Copyright © 2020 Reynaldi Wijaya. All rights reserved.
//

import UIKit

class ChallengeCell: UICollectionViewCell {
    
    var model: ChallengeModel? {
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
    
    func setupViews() {
        self.addSubview(contentChallengeView)
        contentChallengeView.addSubview(imageBackdropView)
        contentChallengeView.addSubview(stackViewTopic)
        stackViewTopic.addArrangedSubview(topicLabel)
        stackViewTopic.addArrangedSubview(separetLabel)
        stackViewTopic.addArrangedSubview(subtopicLabel)
        contentChallengeView.addSubview(titleLabel)
        contentChallengeView.addSubview(stackLevelAndTimeView)
        stackLevelAndTimeView.addArrangedSubview(stackViewLevel)
        stackViewLevel.addArrangedSubview(imageBarView)
        stackViewLevel.addArrangedSubview(levelLabel)
        stackLevelAndTimeView.addArrangedSubview(stackViewTime)
        stackViewTime.addArrangedSubview(imageTimeView)
        stackViewTime.addArrangedSubview(timeLabel)
        contentChallengeView.addSubview(stackViewTakeChallenge)
        stackViewTakeChallenge.addArrangedSubview(buttonTakeChallenge)
        stackViewTakeChallenge.addArrangedSubview(takeChallengeLabel)
    }
    
    func setupConstraints() {
        setupContentChallengeViewConstraint()
        setupImageBackdropConstraint()
        setupStackViewTopicConstraint()
        setupTitleLabelConstraint()
        setupStackLevelAndTimeConstraint()
        setWidthImageBar()
        setWidthImageTime()
        setupStackViewTakeChallengeConstraint()
        setupWidthImageTakeChallenge()
    }
    
    let contentChallengeView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        return view
    }()
    
    func setupContentChallengeViewConstraint() {
        contentChallengeView.anchor(top: topAnchor, bottom: bottomAnchor, leading: leadingAnchor, trailing: trailingAnchor, marginTop: 0, marginBottom: 0, marginLeading: 0, marginTrailing: 0, width: 0, height: 0, centerX: contentChallengeView.centerXAnchor, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
    }
    
    
    let imageBackdropView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    func setupImageBackdropConstraint() {
        imageBackdropView.anchor(top: contentChallengeView.topAnchor, bottom: nil, leading: contentChallengeView.leadingAnchor, trailing: contentChallengeView.trailingAnchor, marginTop: 0, marginBottom: 0, marginLeading: 0, marginTrailing: 0, width: 0, height: 0, centerX: nil, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
        imageBackdropView.heightAnchor.constraint(equalToConstant: 112).isActive = true
    }
    
    let stackViewTopic: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fill
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.spacing = 2
        return stackView
    }()
    
    let topicLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 5)
        label.textColor = Colors.bluePrimaryColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let separetLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 5)
        label.textColor = Colors.bluePrimaryColor
        label.text = ">"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let subtopicLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 5)
        label.textColor = Colors.bluePrimaryColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func setupStackViewTopicConstraint() {
        stackViewTopic.anchor(top: imageBackdropView.bottomAnchor, bottom: nil, leading: contentChallengeView.leadingAnchor, trailing: nil, marginTop: 10, marginBottom: 0, marginLeading: 13, marginTrailing: 0, width: contentChallengeView.frame.width / 2, height: 0, centerX: nil, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
    }
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = Colors.bluePrimaryColor
        label.font = UIFont.boldSystemFont(ofSize: 11)
        label.numberOfLines = 3
        return label
    }()
    
    func setupTitleLabelConstraint() {
        titleLabel.anchor(top: stackViewTopic.bottomAnchor, bottom: nil, leading: contentChallengeView.leadingAnchor, trailing: contentChallengeView.trailingAnchor, marginTop: 0, marginBottom: 0, marginLeading: 13, marginTrailing: 13, width: 0, height: 40, centerX: nil, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
    }
    
    let stackLevelAndTimeView: UIStackView = {
        let stackview = UIStackView()
        stackview.distribution = .fillEqually
        stackview.axis = .horizontal
        stackview.spacing = 0
        return stackview
    }()

    func setupStackLevelAndTimeConstraint() {
        stackLevelAndTimeView.anchor(top: titleLabel.bottomAnchor, bottom: nil, leading: contentChallengeView.leadingAnchor, trailing: contentChallengeView.trailingAnchor, marginTop: 6, marginBottom: 0, marginLeading: 13, marginTrailing: 13, width: contentChallengeView.frame.width, height: 0, centerX: nil, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
    }
    
    let stackViewLevel: UIStackView = {
        let stackview = UIStackView()
        stackview.distribution = .fill
        stackview.axis = .horizontal
        stackview.spacing = 4
        return stackview
    }()
    
    let imageBarView: UIImageView = {
        let imageview = UIImageView()
        imageview.image = UIImage(named: "bars")
        imageview.contentMode = .scaleAspectFit
        return imageview
    }()
    
    let levelLabel: UILabel = {
        let label = UILabel()
        label.textColor = Colors.bluePrimaryColor
        label.font = UIFont.systemFont(ofSize: 8)
        return label
    }()
    
    func setWidthImageBar() {
        imageBarView.translatesAutoresizingMaskIntoConstraints = false
        imageBarView.widthAnchor.constraint(equalToConstant: 9).isActive = true
        imageBarView.heightAnchor.constraint(equalToConstant: 9).isActive = true
    }
    
    let stackViewTime: UIStackView = {
        let stackview = UIStackView()
        stackview.distribution = .fill
        stackview.axis = .horizontal
        stackview.spacing = 4
        return stackview
    }()
    
    let imageTimeView: UIImageView = {
        let imageview = UIImageView()
        imageview.image = UIImage(named: "time")
        imageview.contentMode = .scaleAspectFit
        return imageview
    }()
    
    let timeLabel: UILabel = {
        let label = UILabel()
        label.textColor = Colors.bluePrimaryColor
        label.font = UIFont.systemFont(ofSize: 8)
        return label
    }()
    
    func setWidthImageTime() {
        imageTimeView.translatesAutoresizingMaskIntoConstraints = false
        imageTimeView.widthAnchor.constraint(equalToConstant: 9).isActive = true
        imageTimeView.heightAnchor.constraint(equalToConstant: 9).isActive = true
    }
    
    let stackViewTakeChallenge: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fill
        stackView.axis = .horizontal
        stackView.spacing = 4
        return stackView
    }()
    
    fileprivate func setupStackViewTakeChallengeConstraint() {
        stackViewTakeChallenge.anchor(top: stackLevelAndTimeView.bottomAnchor, bottom: nil, leading: contentChallengeView.leadingAnchor, trailing: contentChallengeView.trailingAnchor, marginTop: 6, marginBottom: 0, marginLeading: 13, marginTrailing: 13, width: 0, height: 0, centerX: nil, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
    }
    
    let buttonTakeChallenge: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "take"), for: .normal)
        return button
    }()
    
    func setupWidthImageTakeChallenge() {
        buttonTakeChallenge.translatesAutoresizingMaskIntoConstraints = false
        buttonTakeChallenge.widthAnchor.constraint(equalToConstant: 20).isActive = true
        buttonTakeChallenge.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    let takeChallengeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10)
        label.textColor = Colors.bluePrimaryColor
        label.text = "Take Challenge"
        return label
    }()
    
    func updateUI() {
        imageBackdropView.image = model?.imageView
        topicLabel.text = model?.topic
        subtopicLabel.text = model?.subTopic
        titleLabel.text = model?.title
        levelLabel.text = model?.level
        timeLabel.text = model?.time
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
