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
}
