//
//  LiveClassModel.swift
//  owl
//
//  Created by Reynaldi Wijaya on 02/06/20.
//  Copyright © 2020 Reynaldi Wijaya. All rights reserved.
//

import UIKit

struct LiveClassModel {
    var title: String?
    var rank: Int = 0
    var topic: String?
    var subTopic: String?
    var speakerName: String?
    var imageName: String?
    var imagePoster: UIImage? {
        return UIImage(named: imageName ?? "")
    }
    
    static func getDummyLiveClassModel() -> [LiveClassModel] {
        var liveModels = [LiveClassModel]()
        
        let model = LiveClassModel(title: "Connect ML Core", rank: 1, topic: "Coding", subTopic: "Swift", speakerName: "Sukiem", imageName: "sukiem")
        let model1 = LiveClassModel(title: "Connect ML Core", rank: 1, topic: "Coding", subTopic: "Swift", speakerName: "Surti", imageName: "surti")
        
        liveModels.append(model)
        liveModels.append(model1)
        
        return liveModels
    }
}
