//
//  ProjectView.swift
//  owl
//
//  Created by Reynaldi Wijaya on 03/06/20.
//  Copyright © 2020 Reynaldi Wijaya. All rights reserved.
//

import UIKit

class ProjectView: UIView {
    
    @IBOutlet weak var pblCollectionView: UICollectionView!
        
    let pblView = PBLView()
    let syllabusView = SyllabusView()
    
    var categoryChallengeModels = [CategoryChallengeModel]()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = Colors.greyColorBackground
        
        categoryChallengeModels = CategoryChallengeModel.getDummyCategoryChallengeModel()
        
        setupViews()
        setupConstraints()
        
        setupCollectionView()
    }
    
    fileprivate func setupViews() {
        self.addSubview(stackView)
        stackView.addArrangedSubview(stackTopicView)
        stackView.addArrangedSubview(segmentedControl)
        stackTopicView.addArrangedSubview(imageIcon)
        stackTopicView.addArrangedSubview(topicLabel)
        self.addSubview(contentView)
        contentView.addSubview(pblView)
        contentView.addSubview(syllabusView)
        
        pblView.isHidden = false
        syllabusView.isHidden = true
    }
    
    fileprivate func setupConstraints() {
        setupStackViewConstraint()
        setupSizeOfImageIcon()
        setupContentViewConstraint()
        setupPBLConstraint()
        setupSyllabusConstraint()
    }
    
    fileprivate func setupCollectionView() {
        self.pblCollectionView = pblView.pblCV
        self.pblCollectionView.delegate = self
        self.pblCollectionView.dataSource = self
        self.pblCollectionView.register(ProjectCategoryCell.self, forCellWithReuseIdentifier: Constants.PROJECT_CATEGORY_CELL_IDENTIFIER)

    }
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        return stackView
    }()
    
    fileprivate func setupStackViewConstraint() {
        stackView.anchor(top: self.safeAreaLayoutGuide.topAnchor, bottom: nil, leading: self.leadingAnchor, trailing: self.trailingAnchor, marginTop: 20, marginBottom: 0, marginLeading: 30, marginTrailing: -30, width: 0, height: 30, centerX: nil, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
    }
    
    let items = ["PBL", "Syllabus"]
    
    lazy var segmentedControl: UISegmentedControl = {
        let sc = UISegmentedControl(items: items)
        sc.layer.cornerRadius = 20
        sc.selectedSegmentIndex = 0
        sc.layer.borderColor = Colors.backgroundSegmentedColor.cgColor
        sc.backgroundColor = Colors.backgroundSegmentedColor
        sc.layer.borderWidth = 1
        sc.layer.masksToBounds = true
        sc.tintColor = .black
        return sc
    }()
    
    lazy var stackTopicView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fill
        stackView.axis = .horizontal
        stackView.spacing = 8
        return stackView
    }()
    
    lazy var imageIcon: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    func setupSizeOfImageIcon() {
        imageIcon.widthAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    lazy var topicLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 25)
        label.numberOfLines = 2
        return label
    }()
    
    lazy var contentView: UIView = {
        let view = UIView()
        return view
    }()
    
    fileprivate func setupContentViewConstraint() {
        contentView.anchor(top: stackView.bottomAnchor, bottom: self.safeAreaLayoutGuide.bottomAnchor, leading: self.leadingAnchor, trailing: self.trailingAnchor, marginTop: 20, marginBottom: 8, marginLeading: 0, marginTrailing: 0, width: 0, height: 0, centerX: nil, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
    }
    
    fileprivate func setupPBLConstraint() {
        pblView.anchor(top: contentView.topAnchor, bottom: contentView.bottomAnchor, leading: contentView.leadingAnchor, trailing: contentView.trailingAnchor, marginTop: 0, marginBottom: 0, marginLeading: 0, marginTrailing: 0, width: 0, height: 0, centerX: nil, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
    }
    
    fileprivate func setupSyllabusConstraint() {
        syllabusView.anchor(top: contentView.topAnchor, bottom: contentView.bottomAnchor, leading: contentView.leadingAnchor, trailing: contentView.trailingAnchor, marginTop: 0, marginBottom: 0, marginLeading: 0, marginTrailing: 0, width: 0, height: 0, centerX: nil, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ProjectView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryChallengeModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.PROJECT_CATEGORY_CELL_IDENTIFIER, for: indexPath) as! ProjectCategoryCell
        
        cell.categoryChallengeModel = categoryChallengeModels[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width, height: 200)
    }
}
