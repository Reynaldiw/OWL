//
//  PopularChallengesView.swift
//  owl
//
//  Created by Reynaldi Wijaya on 25/05/20.
//  Copyright © 2020 Reynaldi Wijaya. All rights reserved.
//

import UIKit

class PopularChallengesView: UIView {
    
    let screenSize = UIScreen.main.bounds

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        self.addSubview(stackView)
        stackView.addArrangedSubview(verticalLineView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(imageArrowRightView)
        self.addSubview(popularChallengesCV)
    }
    
    func setupConstraints() {
        setupStackViewConstraint()
        setupWidthLineView()
        setupImageArrowConstraint()
        setupPopularChallengesCVConstraint()
    }
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.axis = .horizontal
        stackView.spacing = 20
        return stackView
    }()
    
    func setupStackViewConstraint() {
        stackView.anchor(top: topAnchor, bottom: nil, leading: leadingAnchor, trailing: nil, marginTop: 0, marginBottom: 0, marginLeading: 30, marginTrailing: 0, width: screenSize.width - 60, height: 20, centerX: centerXAnchor, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
    }
    
    let verticalLineView: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.greenSecondaryColor
        return view
    }()
    
    fileprivate func setupWidthLineView() {
        verticalLineView.translatesAutoresizingMaskIntoConstraints = false
        verticalLineView.widthAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = Colors.greenPrimaryColor
        label.text = "Most Popular Challenges"
        return label
    }()
    
    let imageArrowRightView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "arrowRight")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    fileprivate func setupImageArrowConstraint() {
        imageArrowRightView.translatesAutoresizingMaskIntoConstraints = false
        imageArrowRightView.widthAnchor.constraint(equalToConstant: 14).isActive = true
    }
    
    let popularChallengesCV: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 30)
        flowLayout.minimumInteritemSpacing = 13
        flowLayout.minimumLineSpacing = 13
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        cv.backgroundColor = .clear
        cv.showsHorizontalScrollIndicator = false
        return cv
    }()
    
    fileprivate func setupPopularChallengesCVConstraint() {
        popularChallengesCV.anchor(top: stackView.bottomAnchor, bottom: self.bottomAnchor, leading: self.leadingAnchor, trailing: self.trailingAnchor, marginTop: 10, marginBottom: 10, marginLeading: 0, marginTrailing: 0, width: 0, height: 230, centerX: nil, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
