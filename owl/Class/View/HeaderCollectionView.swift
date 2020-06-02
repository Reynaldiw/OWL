//
//  HeaderCollectionView.swift
//  owl
//
//  Created by Reynaldi Wijaya on 02/06/20.
//  Copyright © 2020 Reynaldi Wijaya. All rights reserved.
//

import UIKit

class HeaderCollectionView: UIView {
    
    let screenSize = UIScreen.main.bounds

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(stackView)
        stackView.addArrangedSubview(verticalLineView)
        stackView.addArrangedSubview(titleLabel)
        
        // Constraints
        setupStackViewConstraint()
        setupWidthLineView()
    }
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.axis = .horizontal
        stackView.spacing = 5
        return stackView
    }()
    
    func setupStackViewConstraint() {
        stackView.anchor(top: topAnchor, bottom: bottomAnchor, leading: leadingAnchor, trailing: trailingAnchor, marginTop: 0, marginBottom: 0, marginLeading: 0, marginTrailing: 0, width: 0, height: 0, centerX: centerXAnchor, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
    }
    
    let verticalLineView: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.bluePrimaryColor
        return view
    }()
    
    fileprivate func setupWidthLineView() {
        verticalLineView.translatesAutoresizingMaskIntoConstraints = false
        verticalLineView.widthAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = Colors.bluePrimaryColor
        return label
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
