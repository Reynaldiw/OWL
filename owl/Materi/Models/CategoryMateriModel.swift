//
//  CategoryMateriModel.swift
//  owl
//
//  Created by Reynaldi Wijaya on 14/06/20.
//  Copyright © 2020 Reynaldi Wijaya. All rights reserved.
//

import Foundation

struct CategoryMateriModel {
    var title: String?
    var isLive: Bool = false
    var isDone: Bool = false
    var isBookmark: Bool = false
    
    static func getDummyData() -> [CategoryMateriModel] {
        var results = [CategoryMateriModel]()
        
        let model = CategoryMateriModel(title: "Basic Operators", isLive: false, isDone: true, isBookmark: true)
        let model2 = CategoryMateriModel(title: "Collection Types", isLive: false, isDone: true, isBookmark: false)
        let model3 = CategoryMateriModel(title: "Variables", isLive: true, isDone: false, isBookmark: true)
        let model4 = CategoryMateriModel(title: "Control Flow", isLive: false, isDone: false, isBookmark: false)
        let model5 = CategoryMateriModel(title: "String & Characters", isLive: false, isDone: false, isBookmark: false)
        let model6 = CategoryMateriModel(title: "Function", isLive: true, isDone: false, isBookmark: false)
        let model7 = CategoryMateriModel(title: "Closures", isLive: false, isDone: false, isBookmark: false)
        let model8 = CategoryMateriModel(title: "Enumerations", isLive: false, isDone: false, isBookmark: false)
        let model9 = CategoryMateriModel(title: "Structure & Classes", isLive: false, isDone: false, isBookmark: false)
        
        results.append(model)
        results.append(model2)
        results.append(model3)
        results.append(model4)
        results.append(model5)
        results.append(model6)
        results.append(model7)
        results.append(model8)
        results.append(model9)

        return results
    }
}
