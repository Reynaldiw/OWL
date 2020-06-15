//
//  LearningMaterialVC.swift
//  owl
//
//  Created by Reynaldi Wijaya on 15/06/20.
//  Copyright © 2020 Reynaldi Wijaya. All rights reserved.
//

import UIKit

class LearningMaterialVC: UIViewController {
    
    
    var learningMaterialView: LearningMaterialView { return self.view as! LearningMaterialView }
    
    var categoryMateriModel: CategoryMateriModel?
        
    override func loadView() {
        self.view = LearningMaterialView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupNavigationItem()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    fileprivate func setupNavigationItem() {
        title = categoryMateriModel?.title
    }

}
