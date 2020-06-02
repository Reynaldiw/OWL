//
//  DummyCategoryLearnModel.swift
//  owl
//
//  Created by Reynaldi Wijaya on 02/06/20.
//  Copyright © 2020 Reynaldi Wijaya. All rights reserved.
//

import Foundation

struct DummyCategoryLearnModel {
    var title: String?
    var topics: DummyTopicLearnModel?
    
    static func getDummyCategoryLearn() -> [DummyCategoryLearnModel] {
        
        let categoryModels = [DummyCategoryLearnModel]()
        
        let topicModel = DummyTopicLearnModel(title: "Swift", imageName: "swift")
        
        return categoryModels
    }
}
