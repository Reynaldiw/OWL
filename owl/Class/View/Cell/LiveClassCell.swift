//
//  LiveClassCell.swift
//  owl
//
//  Created by Reynaldi Wijaya on 02/06/20.
//  Copyright © 2020 Reynaldi Wijaya. All rights reserved.
//

import UIKit

class LiveClassCell: UICollectionViewCell {
    
    var liveClassModel: LiveClassModel? {
        didSet {
            self.updateUI()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        self.addSubview(contentLiveView)
        contentLiveView.addSubview(stackView)
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(informationOfLiveView)
        informationOfLiveView.addSubview(topicLabel)
        informationOfLiveView.addSubview(titleLabel)
        informationOfLiveView.addSubview(speakerLabel)
        informationOfLiveView.addSubview(joinButton)
    }
    
    func setupConstraints() {
        setupContentLiveConstraint()
        setupStackViewConstraint()
        setupSizeOfImageView()
        setupTopicLabelConstraint()
        setupTitleConstraint()
        setupSpeakerConstraint()
        setupJoinButtonConstraint()
    }
    
    lazy var contentLiveView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    func setupContentLiveConstraint() {
        contentLiveView.anchor(top: self.topAnchor, bottom: self.bottomAnchor, leading: self.leadingAnchor, trailing: self.trailingAnchor, marginTop: 0, marginBottom: 0, marginLeading: 0, marginTrailing: 0, width: 0, height: 0, centerX: nil, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
    }
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.axis = .horizontal
        stackView.spacing = 14
        return stackView
    }()
    
    fileprivate func setupStackViewConstraint() {
        stackView.anchor(top: contentLiveView.topAnchor, bottom: contentLiveView.bottomAnchor, leading: contentLiveView.leadingAnchor, trailing: contentLiveView.trailingAnchor, marginTop: 0, marginBottom: 0, marginLeading: 0, marginTrailing: 0, width: 0, height: 0, centerX: nil, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
    }
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 10
        return imageView
    }()
    
    fileprivate func setupSizeOfImageView() {
        imageView.widthAnchor.constraint(equalToConstant: 91).isActive = true
    }
    
    lazy var informationOfLiveView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    let topicLabel: UILabel = {
        let label = UILabel()
        label.textColor = Colors.blueSecondaryColor
        label.font = .systemFont(ofSize: 11)
        return label
    }()
    
    fileprivate func setupTopicLabelConstraint() {
        topicLabel.anchor(top: informationOfLiveView.topAnchor, bottom: nil, leading: informationOfLiveView.leadingAnchor, trailing: informationOfLiveView.trailingAnchor, marginTop: 8, marginBottom: 0, marginLeading: 0, marginTrailing: 4, width: 0, height: 0, centerX: nil, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
    }
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 15)
        label.numberOfLines = 2
        return label
    }()
    
    fileprivate func setupTitleConstraint() {
        titleLabel.anchor(top: topicLabel.bottomAnchor, bottom: nil, leading: informationOfLiveView.leadingAnchor, trailing: informationOfLiveView.trailingAnchor, marginTop: 0, marginBottom: 0, marginLeading: 0, marginTrailing: 4, width: 0, height: 0, centerX: nil, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
    }
    
    lazy var speakerLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 13)
        label.numberOfLines = 2
        return label
    }()
    
    fileprivate func setupSpeakerConstraint() {
        speakerLabel.anchor(top: titleLabel.bottomAnchor, bottom: nil, leading: informationOfLiveView.leadingAnchor, trailing: informationOfLiveView.trailingAnchor, marginTop: 4, marginBottom: 0, marginLeading: 0, marginTrailing: 4, width: 0, height: 0, centerX: nil, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
    }
    
    lazy var joinButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = Colors.blueSecondaryColor
        button.setTitle("JOIN", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 12)
        button.titleLabel?.textColor = .white
        button.layer.cornerRadius = 8
        return button
    }()
    
    func setupJoinButtonConstraint() {
        joinButton.anchor(top: nil, bottom: informationOfLiveView.bottomAnchor, leading: informationOfLiveView.leadingAnchor, trailing: nil, marginTop: 0, marginBottom: -8, marginLeading: 0, marginTrailing: 0, width: 54, height: 18, centerX: nil, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
    }
    
    func updateUI() {
        imageView.image = liveClassModel?.imagePoster
        if let rank = liveClassModel?.rank, let topic = liveClassModel?.topic, let subTopic = liveClassModel?.subTopic {
            topicLabel.text = "#\(String(rank)) - \(topic) - \(subTopic)"
        }
        titleLabel.text = liveClassModel?.title
        speakerLabel.text = liveClassModel?.speakerName
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
