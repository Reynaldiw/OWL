//
//  InterestMenuModel.swift
//  owl
//
//  Created by Reynaldi Wijaya on 25/05/20.
//  Copyright © 2020 Reynaldi Wijaya. All rights reserved.
//

import UIKit

struct InterestMenuModel {
    var id: Int?
    var imageNamed: String?
    var imageMenuView: UIImage? {
        return UIImage(named: imageNamed ?? "")
    }
    var titleMenu: String?
    var overview: String?
    var rating: Float?
    var totalStudents: Int?
}
