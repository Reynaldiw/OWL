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
    var topics: [DummyTopicLearnModel]?
    
    static func getDummyCategoryLearn() -> [DummyCategoryLearnModel] {
        
        var categoryModels = [DummyCategoryLearnModel]()
        
        let topicModel = DummyTopicLearnModel(title: "Swift", imageName: "swift")
        let topicModel2 = DummyTopicLearnModel(title: "C++", imageName: "c++")
        let topicModel3 = DummyTopicLearnModel(title: "PHP", imageName: "php")
        let topicModel4 = DummyTopicLearnModel(title: "Phyton", imageName: "phyton")
        let categoryLearnModel = DummyCategoryLearnModel(title: "Language Programming", topics: [topicModel, topicModel2, topicModel3, topicModel4])
        
        let topicModel5 = DummyTopicLearnModel(title: "UI", imageName: "ui")
        let topicModel6 = DummyTopicLearnModel(title: "UX", imageName: "ux")
        let topicModel7 = DummyTopicLearnModel(title: "Illustration", imageName: "illustrationTopic")
        let topicModel8 = DummyTopicLearnModel(title: "Logo", imageName: "logo")
        let categoryLearnModel2 = DummyCategoryLearnModel(title: "Design", topics: [topicModel5, topicModel6, topicModel7, topicModel8])
        
        let topicModel9 = DummyTopicLearnModel(title: "Web SEO", imageName: "webSeo")
        let topicModel10 = DummyTopicLearnModel(title: "Video ADS", imageName: "videoAds")
        let topicModel11 = DummyTopicLearnModel(title: "ADS Promotion", imageName: "adsPromotion")
        let topicModel12 = DummyTopicLearnModel(title: "Social Media Promotion", imageName: "socialMediaPromotion")
        let categoryLearnModel3 = DummyCategoryLearnModel(title: "Marketing", topics: [topicModel9, topicModel10, topicModel11, topicModel12])
        
        categoryModels.append(categoryLearnModel)
        categoryModels.append(categoryLearnModel2)
        categoryModels.append(categoryLearnModel3)
        
        return categoryModels
    }
}
