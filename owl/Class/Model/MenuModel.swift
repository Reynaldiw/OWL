//
//  MenuModel.swift
//  owl
//
//  Created by Reynaldi Wijaya on 02/06/20.
//  Copyright © 2020 Reynaldi Wijaya. All rights reserved.
//

import UIKit

struct MenuModel {
    var title: String?
    var imageName: String?
    var imagePosterView: UIImage? {
        return UIImage(named: imageName ?? "liveClass")
    }
    
    static func getDummyMenuModel() -> [MenuModel] {
        
        var menuModels = [MenuModel]()
                
        let model = MenuModel(title: "Live Class", imageName: "liveClass")
        let model2 = MenuModel(title: "Forum", imageName: "forum")
        let model3 = MenuModel(title: "Mentor", imageName: "mentor")
        let model4 = MenuModel(title: "Leaderboard", imageName: "leaderboard")
       
        menuModels.append(model)
        menuModels.append(model2)
        menuModels.append(model3)
        menuModels.append(model4)
        
        return menuModels
    }
}
