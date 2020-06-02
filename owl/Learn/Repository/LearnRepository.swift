//
//  LearnRepository.swift
//  owl
//
//  Created by Reynaldi Wijaya on 02/06/20.
//  Copyright © 2020 Reynaldi Wijaya. All rights reserved.
//

import Foundation
import CoreData

struct LearnRepository: LearnService {
    
    func getLocalCategoryLearnModel(onSuccess: @escaping ([CategoryLearnModel]) -> Void, onFailed: @escaping (String) -> Void) {
        let request: NSFetchRequest<CategoryLearnModel> = CategoryLearnModel.fetchRequest()
        
        var resultModels = [CategoryLearnModel]()
        
        do {
            resultModels = try PersistenceService.context.fetch(request)
            onSuccess(resultModels)
        } catch {
            onFailed("Something Wrong when get local category learn data \(error)")
        }
    }
    
    func getLocalTopicLearnModel(with request: NSFetchRequest<TopicLearnModel>, predicate: NSPredicate?, parentModel: CategoryLearnModel?, onSuccess: @escaping ([TopicLearnModel]) -> Void, onFailed: @escaping (String) -> Void) {
        
        guard let wrapParentModel = parentModel else {
            return
        }
        
        let categoryLearnPredicate = NSPredicate(format: "parentCategoryLearn.title MATCHES %@", wrapParentModel.categoryTitle!)
        
        if let additionalPredicate = predicate {
            request.predicate = NSCompoundPredicate(andPredicateWithSubpredicates: [categoryLearnPredicate, additionalPredicate])
        } else {
            request.predicate = categoryLearnPredicate
        }
        
        var resultModels = [TopicLearnModel]()
        
        do {
            resultModels = try PersistenceService.context.fetch(request)
            onSuccess(resultModels)
        } catch {
            onFailed("Something Wrong when get local topic learn data \(error)")
        }
    }
    
    func saveData(onSuccess: @escaping (String) -> Void, onFailed: @escaping (String) -> Void) {
        do {
            try PersistenceService.context.save()
            onSuccess("Success!")
        } catch {
            onFailed("Something wront when saving data \(error)")
        }
    }
    
    
}
