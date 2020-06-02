//
//  ProjectModel.swift
//  owl
//
//  Created by Reynaldi Wijaya on 02/06/20.
//  Copyright © 2020 Reynaldi Wijaya. All rights reserved.
//

import UIKit

struct ProjectModel {
    var id: Int?
    var imageNamed: String?
    var imageView: UIImage? {
        return UIImage(named: imageNamed ?? "")
    }
    var topic: String?
    var subTopic: String?
    var title: String?
    
    static func getDummyProjectModel() -> [ProjectModel] {
        
        var projectModels = [ProjectModel]()
                
        // Setup Challenge Model
        let modelChallenge = ProjectModel(id: 1, imageNamed: "dummyChallenge", topic: "Coding", subTopic: "Swift", title: "Make simpel augmented reality app using swift")
        let modelChallenge2 = ProjectModel(id: 2, imageNamed: "dummyChallenge2", topic: "Design", subTopic: "UX", title: "Create Education App User Flow")
        let modelChallenge3 = ProjectModel(id: 1, imageNamed: "dummyChallenge", topic: "Coding", subTopic: "Swift", title: "Make simpel augmented reality app using swift")
        
        projectModels.append(modelChallenge)
        projectModels.append(modelChallenge2)
        projectModels.append(modelChallenge3)
        
        return projectModels
    }
}

