//
//  DashboardView.swift
//  owl
//
//  Created by Reynaldi Wijaya on 24/05/20.
//  Copyright © 2020 Reynaldi Wijaya. All rights reserved.
//

import UIKit

class DashboardView: UIView {
    
    var interestEducationView = InterestEducationMenuView()
    let popularChallengeView = PopularChallengesView()
    
    // Add Scroll View
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1.00)
        return scrollView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
    }
    
    fileprivate func setupViews() {
        self.addSubview(scrollView)
        scrollView.contentSize = CGSize(width: frame.width, height: 1000)
        
        scrollView.addSubview(imageDashboardView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(subTitleLabel)
        scrollView.addSubview(stackView)
        scrollView.addSubview(interestEducationView)
        scrollView.addSubview(popularChallengeView)
    }
    
    fileprivate func setupConstraints() {
        setupScrollViewConstraint()
        setupImageDashboardConstraint()
        setupStackViewConstraint()
        setupInterestEducucationViewConstraint()
        setupPopularChallengeViewConstraint()
    }
    
    fileprivate func setupScrollViewConstraint() {
        scrollView.anchor(top: topAnchor, bottom: bottomAnchor, leading: leadingAnchor, trailing: trailingAnchor, marginTop: 0, marginBottom: 0, marginLeading: 0, marginTrailing: 0, width: 0, height: 0, centerX: nil, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
    }
    
    // Add Image View
    let imageDashboardView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "illustrationDashboard")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    fileprivate func setupImageDashboardConstraint() {
        imageDashboardView.anchor(top: scrollView.topAnchor, bottom: nil, leading: nil, trailing: nil, marginTop: 30, marginBottom: 0, marginLeading: 0, marginTrailing: 0, width: 0, height: 112, centerX: scrollView.centerXAnchor, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
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
        title.textColor = Colors.greenPrimaryColor
        title.font = UIFont.boldSystemFont(ofSize: 21)
        title.textAlignment = .center
        return title
    }()
    
    let subTitleLabel: UILabel = {
        let title = UILabel()
        title.text = "What would you like to learn today? Find it below."
        title.textColor = Colors.greenPrimaryColor
        title.font = UIFont.systemFont(ofSize: 15)
        title.textAlignment = .center
        title.numberOfLines = 2
        return title
    }()
    
    fileprivate func setupStackViewConstraint() {
        stackView.anchor(top: imageDashboardView.bottomAnchor, bottom: nil, leading: nil, trailing: nil, marginTop: 10, marginBottom: 0, marginLeading: 0, marginTrailing: 0, width: 180, height: 0, centerX: scrollView.centerXAnchor, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
    }
    
    fileprivate func setupInterestEducucationViewConstraint() {
        interestEducationView.anchor(top: stackView.bottomAnchor, bottom: nil, leading: scrollView.leadingAnchor, trailing: scrollView.trailingAnchor, marginTop: 40, marginBottom: 30, marginLeading: 0, marginTrailing: 0, width: 0, height: 120, centerX: nil, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
    }
    
    fileprivate func setupPopularChallengeViewConstraint() {
        popularChallengeView.anchor(top: interestEducationView.bottomAnchor, bottom: scrollView.bottomAnchor, leading: scrollView.leadingAnchor, trailing: scrollView.trailingAnchor, marginTop: 30, marginBottom: 20, marginLeading: 0, marginTrailing: 0, width: 0, height: 0, centerX: nil, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
