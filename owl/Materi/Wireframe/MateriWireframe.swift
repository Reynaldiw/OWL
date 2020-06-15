//
//  MateriWireframe.swift
//  owl
//
//  Created by Reynaldi Wijaya on 15/06/20.
//  Copyright © 2020 Reynaldi Wijaya. All rights reserved.
//

import UIKit

struct MateriWireframe {
    static func moveToLearningMaterial(category: CategoryMateriModel?, caller: UIViewController) {
        let destinationVC = LearningMaterialVC()
        destinationVC.categoryMateriModel = category
        
        caller.navigationController?.pushViewController(destinationVC, animated: true)
    }
}
