//
//  ChallengeModel.swift
//  owl
//
//  Created by Reynaldi Wijaya on 25/05/20.
//  Copyright © 2020 Reynaldi Wijaya. All rights reserved.
//

import UIKit

struct ChallengeModel {
    var id: Int?
    var idInterestMenu: Int?
    var imageNamed: String?
    var imageView: UIImage? {
        return UIImage(named: imageNamed ?? "")
    }
    var topic: String?
    var subTopic: String?
    var title: String?
    var level: String?
    var time: String?
    var students: Int?
    var rating: Float?
    var overview: String?
    
    static func getDummyChallengeModel() -> [ChallengeModel] {
        
        var challengeModels = [ChallengeModel]()
        
        let dummyOverview = Constants.DUMMY_OVERVIEW
        
        // Setup Challenge Model
        let modelChallenge = ChallengeModel(id: 1, idInterestMenu: 2, imageNamed: "dummyChallenge", topic: "Computer", subTopic: "Coding", title: "Make simpel augmented reality app using swift", level: "Intermediate", time: "15 Hours", students: 128, rating: 7.8, overview: dummyOverview)
        let modelChallenge2 = ChallengeModel(id: 2, idInterestMenu: 4, imageNamed: "dummyChallenge2", topic: "Marketing", subTopic: "Social Media", title: "Easy to grow up instagram account for business", level: "Beginner", time: "8 Hours", students: 128, rating: 7.8, overview: dummyOverview)
        let modelChallenge3 = ChallengeModel(id: 1, idInterestMenu: 2, imageNamed: "dummyChallenge", topic: "Computer", subTopic: "Coding", title: "Make simpel augmented reality app using swift", level: "Intermediate", time: "15 Hours", students: 128, rating: 7.8, overview: dummyOverview)
        let modelChallenge4 = ChallengeModel(id: 2, idInterestMenu: 4, imageNamed: "dummyChallenge2", topic: "Marketing", subTopic: "Social Media", title: "Easy to grow up instagram account for business And Othere Social Media", level: "Beginner", time: "8 Hours", students: 128, rating: 7.8, overview: dummyOverview)
        challengeModels.append(modelChallenge)
        challengeModels.append(modelChallenge2)
        challengeModels.append(modelChallenge3)
        challengeModels.append(modelChallenge4)
        
        return challengeModels
    }
}
