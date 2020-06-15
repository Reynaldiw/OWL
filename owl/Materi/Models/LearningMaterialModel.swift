//
//  LearningMaterialModel.swift
//  owl
//
//  Created by Reynaldi Wijaya on 15/06/20.
//  Copyright © 2020 Reynaldi Wijaya. All rights reserved.
//

import UIKit

struct LearningMaterialModel {
    var title: String?
    var poster: String?
    var imageViewPoster: UIImage? {
        return UIImage(named: poster ?? "")
    }
    var totalSeen: Int = 0
    var rating: Float?
    var writer: String?
    var imageProfileWriter: String?
    var imageViewProfileWriter: UIImage? {
        return UIImage(named: imageProfileWriter ?? "")
    }
    var isDone: Bool = false
    var isBookmark: Bool = false
    var contentMateri: String?
    
    static func getDummyData() -> [LearningMaterialModel] {
        var results = [LearningMaterialModel]()
        
        let model = LearningMaterialModel(title: "What is Variable ?", poster: "exampleFoto2", totalSeen: 120, rating: 7.8, writer: "Alexandra Vockavic", imageProfileWriter: "surti", isDone: true, isBookmark: true, contentMateri: Constants.DUMMY_OVERVIEW)
        let model2 = LearningMaterialModel(title: "What is Variable ?", poster: "exampleFoto2", totalSeen: 120, rating: 7.8, writer: "Alexandra Vockavic", imageProfileWriter: "surti", isDone: true, isBookmark: false, contentMateri: Constants.DUMMY_OVERVIEW)
        let model3 = LearningMaterialModel(title: "What is Variable ?", poster: "exampleFoto2", totalSeen: 120, rating: 7.8, writer: "Alexandra Vockavic", imageProfileWriter: "surti", isDone: false, isBookmark: false, contentMateri: Constants.DUMMY_OVERVIEW)
        let model4 = LearningMaterialModel(title: "What is Variable ?", poster: "exampleFoto2", totalSeen: 120, rating: 7.8, writer: "Alexandra Vockavic", imageProfileWriter: "surti", isDone: false, isBookmark: false, contentMateri: Constants.DUMMY_OVERVIEW)
        let model5 = LearningMaterialModel(title: "What is Variable ?", poster: "exampleFoto2", totalSeen: 120, rating: 7.8, writer: "Alexandra Vockavic", imageProfileWriter: "surti", isDone: false, isBookmark: false, contentMateri: Constants.DUMMY_OVERVIEW)
        
        results.append(model)
        results.append(model2)
        results.append(model3)
        results.append(model4)
        results.append(model5)
        
        return results
    }
    
}
