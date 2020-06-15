//
//  LearningMaterialView.swift
//  owl
//
//  Created by Reynaldi Wijaya on 15/06/20.
//  Copyright © 2020 Reynaldi Wijaya. All rights reserved.
//

import UIKit

class LearningMaterialView: UIView {
    
    let listOfLearningMaterialView = ListOfLearningMaterialView()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = Colors.greyColorBackground
        
        setupViews()
        setupConstraints()
    }
    
    fileprivate func setupViews() {
        self.addSubview(imageThumbnailView)
        imageThumbnailView.addSubview(view)
        imageThumbnailView.addSubview(playButton)
        self.addSubview(buttonInformation)
        self.addSubview(watchLiveButton)
        watchLiveButton.addSubview(redCircleView)
        watchLiveButton.addSubview(labelWatchLive)
        self.addSubview(classroomOptionsButton)
        classroomOptionsButton.addSubview(labelClassroomOptions)
        self.addSubview(materiView)
        materiView.addSubview(segmentedControl)
        materiView.addSubview(listOfLearningMaterialView)
    }
    
    fileprivate func setupConstraints() {
        setupImageThumbnailConstraint()
        setupViewConstraint()
        setupPlayButtonConstraint()
        setupInformationButtonConstraint()
        setupWatchLiveButtonConstraint()
        setupRedCircleConstraint()
        setupLabelWatchLiveConstraint()
        setupClassrommOptionsConstraint()
        setupClassroomOptionsLabelConstraint()
        setupMateriViewConstraint()
        setupSegmentedControlConstraint()
        setupListOfLearningMaterialConstraint()
    }
    
    lazy var imageThumbnailView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.image = UIImage(named: "exampleFoto")
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    fileprivate func setupImageThumbnailConstraint() {
        imageThumbnailView.anchor(top: self.safeAreaLayoutGuide.topAnchor, bottom: nil, leading: self.leadingAnchor, trailing: self.trailingAnchor, marginTop: 10, marginBottom: 0, marginLeading: 20, marginTrailing: -20, width: 0, height: 210, centerX: nil, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
    }
    
    lazy var view: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 1, alpha: 0.2)
        view.layer.cornerRadius = 10
        return view
    }()
    
    fileprivate func setupViewConstraint() {
        view.anchor(top: imageThumbnailView.topAnchor, bottom: imageThumbnailView.bottomAnchor, leading: imageThumbnailView.leadingAnchor, trailing: imageThumbnailView.trailingAnchor, marginTop: 0, marginBottom: 0, marginLeading: 0, marginTrailing: 0, width: 0, height: 0, centerX: nil, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
    }
    
    lazy var playButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "play"), for: .normal)
        return button
    }()
    
    fileprivate func setupPlayButtonConstraint() {
        playButton.anchor(top: nil, bottom: nil, leading: nil, trailing: nil, marginTop: 0, marginBottom: 0, marginLeading: 0, marginTrailing: 0, width: 0, height: 0, centerX: imageThumbnailView.centerXAnchor, centerY: imageThumbnailView.centerYAnchor, marginFromCenterX: 0, marginFromCenterY: 0)
    }
    
    lazy var buttonInformation: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "information"), for: .normal)
        return button
    }()
    
    fileprivate func setupInformationButtonConstraint() {
        buttonInformation.anchor(top: imageThumbnailView.bottomAnchor, bottom: nil, leading: nil, trailing: self.trailingAnchor, marginTop: 15, marginBottom: 0, marginLeading: 0, marginTrailing: -20, width: 30, height: 30, centerX: nil, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
    }
    
    lazy var watchLiveButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 7
        button.backgroundColor = Colors.blueLightColor
        button.setCellShadow()
        return button
    }()
    
    fileprivate func setupWatchLiveButtonConstraint() {
        watchLiveButton.anchor(top: imageThumbnailView.bottomAnchor, bottom: nil, leading: self.leadingAnchor, trailing: nil, marginTop: 15, marginBottom: 0, marginLeading: 20, marginTrailing: 0, width: 0, height: 30, centerX: nil, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
    }
    
    lazy var redCircleView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    fileprivate func setupRedCircleConstraint() {
        redCircleView.anchor(top: nil, bottom: nil, leading: watchLiveButton.leadingAnchor, trailing: nil, marginTop: 0, marginBottom: 0, marginLeading: 5, marginTrailing: 0, width: 10, height: 10, centerX: nil, centerY: watchLiveButton.centerYAnchor, marginFromCenterX: 0, marginFromCenterY: 0)
        redCircleView.layer.cornerRadius = 5
    }
    
    lazy var labelWatchLive: UILabel = {
        let label = UILabel()
        label.text = "Watch Live Expert"
        label.textColor = .white
        label.font = .systemFont(ofSize: 12)
        return label
    }()
    
    fileprivate func setupLabelWatchLiveConstraint() {
        labelWatchLive.anchor(top: nil, bottom: nil, leading: redCircleView.trailingAnchor, trailing: watchLiveButton.trailingAnchor, marginTop: 5, marginBottom: 5, marginLeading: 5, marginTrailing: -5, width: 0, height: 0, centerX: nil, centerY: watchLiveButton.centerYAnchor, marginFromCenterX: 0, marginFromCenterY: 0)
    }
    
    lazy var classroomOptionsButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 7
        button.backgroundColor = UIColor(red: 0.93, green: 0.93, blue: 0.93, alpha: 1.00)
        button.setCellShadow()
        return button
    }()
    
    fileprivate func setupClassrommOptionsConstraint() {
        classroomOptionsButton.anchor(top: imageThumbnailView.bottomAnchor, bottom: nil, leading: watchLiveButton.trailingAnchor, trailing: nil, marginTop: 15, marginBottom: 0, marginLeading: 15, marginTrailing: 0, width: 125, height: 30, centerX: nil, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
    }
    
    lazy var labelClassroomOptions: UILabel = {
        let label = UILabel()
        label.text = "Classroom Options"
        label.textColor = UIColor(red: 0.56, green: 0.56, blue: 0.56, alpha: 1.00)
        label.font = .systemFont(ofSize: 12)
        return label
    }()
    
    fileprivate func setupClassroomOptionsLabelConstraint() {
        labelClassroomOptions.anchor(top: nil, bottom: nil, leading: nil, trailing: nil, marginTop: 0, marginBottom: 0, marginLeading: 0, marginTrailing: 0, width: 0, height: 0, centerX: classroomOptionsButton.centerXAnchor, centerY: classroomOptionsButton.centerYAnchor, marginFromCenterX: 0, marginFromCenterY: 0)
    }
    
    lazy var materiView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    fileprivate func setupMateriViewConstraint() {
        materiView.anchor(top: watchLiveButton.bottomAnchor, bottom: self.bottomAnchor, leading: self.leadingAnchor, trailing: self.trailingAnchor, marginTop: 10, marginBottom: 0, marginLeading: 0, marginTrailing: 0, width: 0, height: 0, centerX: nil, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
    }
    
    lazy var segmentedControl: UISegmentedControl = {
        var itemsSegmentedControl = ["Learning Material", "Activities", "Assesement"]
        
        let segmentedControl = UISegmentedControl(items: itemsSegmentedControl)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.layer.cornerRadius = 10
        segmentedControl.layer.masksToBounds = true
        return segmentedControl
    }()
    
    fileprivate func setupSegmentedControlConstraint() {
        segmentedControl.anchor(top: materiView.topAnchor, bottom: nil, leading: materiView.leadingAnchor, trailing: materiView.trailingAnchor, marginTop: 15, marginBottom: 0, marginLeading: 20, marginTrailing: -20, width: 0, height: 0, centerX: nil, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
    }
    
    fileprivate func setupListOfLearningMaterialConstraint() {
        listOfLearningMaterialView.anchor(top: segmentedControl.bottomAnchor, bottom: materiView.bottomAnchor, leading: materiView.leadingAnchor, trailing: materiView.trailingAnchor, marginTop: 10, marginBottom: 0, marginLeading: 0, marginTrailing: 0, width: 0, height: 0, centerX: nil, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
