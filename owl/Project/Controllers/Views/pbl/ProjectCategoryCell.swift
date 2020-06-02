//
//  ProjectCategoryCell.swift
//  owl
//
//  Created by Reynaldi Wijaya on 03/06/20.
//  Copyright © 2020 Reynaldi Wijaya. All rights reserved.
//

import UIKit

class ProjectCategoryCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
    }
    
    fileprivate func setupViews() {
        self.backgroundColor = .black
    }
    
    fileprivate func setupConstraints() {
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
