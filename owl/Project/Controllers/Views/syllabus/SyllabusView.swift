//
//  SyllabusView.swift
//  owl
//
//  Created by Reynaldi Wijaya on 03/06/20.
//  Copyright © 2020 Reynaldi Wijaya. All rights reserved.
//

import UIKit

class SyllabusView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupOverviewConstraint()
    }
    
    fileprivate func setupViews() {
        self.addSubview(overviewLabel)
    }
    
    fileprivate func setupConstraints() {
        setupOverviewConstraint()
    }
    
    lazy var overviewLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 5
        label.textColor = .black
        label.font = .systemFont(ofSize: 11)
        return label
    }()
    
    fileprivate func setupOverviewConstraint() {
        overviewLabel.anchor(top: self.topAnchor, bottom: nil, leading: self.leadingAnchor, trailing: self.trailingAnchor, marginTop: 18, marginBottom: 0, marginLeading: 30, marginTrailing: 30, width: 0, height: 35, centerX: nil, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
