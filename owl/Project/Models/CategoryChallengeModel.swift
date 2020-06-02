//
//  CategoryChallengeModel.swift
//  owl
//
//  Created by Reynaldi Wijaya on 03/06/20.
//  Copyright © 2020 Reynaldi Wijaya. All rights reserved.
//

import Foundation

struct CategoryChallengeModel {
    var title: String?
    var challenges: [ChallengeModel]?
    
    static func getDummyCategoryChallengeModel() -> [CategoryChallengeModel] {
        
        var finalResultModels = [CategoryChallengeModel]()
        
        let challengeModels = ChallengeModel.getDummyChallengeModel()
        
        let model = CategoryChallengeModel(title: "Augmented Reality", challenges: challengeModels)
        let model2 = CategoryChallengeModel(title: "Core ML", challenges: challengeModels)
        let model3 = CategoryChallengeModel(title: "Siri Kit", challenges: challengeModels)
        
        finalResultModels.append(model)
        finalResultModels.append(model2)
        finalResultModels.append(model3)
        
        return finalResultModels
    }
}
