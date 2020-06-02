//
//  ProjectCategoryCell.swift
//  owl
//
//  Created by Reynaldi Wijaya on 03/06/20.
//  Copyright © 2020 Reynaldi Wijaya. All rights reserved.
//

import UIKit

class ProjectCategoryCell: UICollectionViewCell {
    
    let headerView = HeaderCollectionView()
    
    var challengeModels = [ChallengeModel]()
    
    var categoryChallengeModel: CategoryChallengeModel? {
        didSet {
            self.challengeModels = categoryChallengeModel?.challenges ?? []
            self.headerView.titleLabel.text = categoryChallengeModel?.title ?? ""
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
        
        setupCollectionView()
    }
    
    fileprivate func setupViews() {
        self.addSubview(headerView)
        self.addSubview(challengeCV)
    }
    
    fileprivate func setupConstraints() {
        setupHeaderConstraint()
        setupChallengeCVConstraint()
    }
    
    fileprivate func setupCollectionView() {
        challengeCV.delegate = self
        challengeCV.dataSource = self
        challengeCV.register(ChallengeCell.self, forCellWithReuseIdentifier: Constants.CHALLENGE_CELL_IDENTIFIER)
    }
    
    fileprivate func setupHeaderConstraint() {
        headerView.anchor(top: self.topAnchor, bottom: nil, leading: self.leadingAnchor, trailing: self.trailingAnchor, marginTop: 0, marginBottom: 0, marginLeading: 30, marginTrailing: 30, width: 0, height: 0, centerX: nil, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
    }
    
    lazy var challengeCV: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 30)
        flowLayout.minimumInteritemSpacing = 10
        flowLayout.minimumLineSpacing = 10
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        cv.backgroundColor = .clear
        cv.showsHorizontalScrollIndicator = false
        return cv
    }()
    
    fileprivate func setupChallengeCVConstraint() {
        challengeCV.anchor(top: headerView.bottomAnchor, bottom: self.bottomAnchor, leading: self.leadingAnchor, trailing: self.trailingAnchor, marginTop: 5, marginBottom: 0, marginLeading: 0, marginTrailing: 0, width: 0, height: 0, centerX: nil, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ProjectCategoryCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return challengeModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.CHALLENGE_CELL_IDENTIFIER, for: indexPath) as! ChallengeCell
        
        cell.model = challengeModels[indexPath.item]
                
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 140, height: 170)
    }
}

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
        imageBackdropView.heightAnchor.constraint(equalToConstant: frame.height / 2).isActive = true
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
        label.font = UIFont.boldSystemFont(ofSize: 9)
        label.numberOfLines = 3
        return label
    }()
    
    func setupTitleLabelConstraint() {
        titleLabel.anchor(top: stackViewTopic.bottomAnchor, bottom: nil, leading: contentChallengeView.leadingAnchor, trailing: contentChallengeView.trailingAnchor, marginTop: 0, marginBottom: 0, marginLeading: 10, marginTrailing: -10, width: 0, height: 40, centerX: nil, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
    }
    
    let stackLevelAndTimeView: UIStackView = {
        let stackview = UIStackView()
        stackview.distribution = .fillEqually
        stackview.axis = .horizontal
        stackview.spacing = 0
        return stackview
    }()

    func setupStackLevelAndTimeConstraint() {
        stackLevelAndTimeView.anchor(top: titleLabel.bottomAnchor, bottom: nil, leading: contentChallengeView.leadingAnchor, trailing: contentChallengeView.trailingAnchor, marginTop: 3, marginBottom: 0, marginLeading: 10, marginTrailing: -10, width: contentChallengeView.frame.width, height: 0, centerX: nil, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
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
        stackViewTakeChallenge.anchor(top: stackLevelAndTimeView.bottomAnchor, bottom: nil, leading: contentChallengeView.leadingAnchor, trailing: contentChallengeView.trailingAnchor, marginTop: 3, marginBottom: -2, marginLeading: 10, marginTrailing: -10, width: 0, height: 0, centerX: nil, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
    }
    
    let buttonTakeChallenge: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "take"), for: .normal)
        return button
    }()
    
    func setupWidthImageTakeChallenge() {
        buttonTakeChallenge.translatesAutoresizingMaskIntoConstraints = false
        buttonTakeChallenge.widthAnchor.constraint(equalToConstant: 13).isActive = true
        buttonTakeChallenge.heightAnchor.constraint(equalToConstant: 13).isActive = true
    }
    
    let takeChallengeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 8)
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
