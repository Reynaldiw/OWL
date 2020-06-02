//
//  LearnVC.swift
//  owl
//
//  Created by Reynaldi Wijaya on 02/06/20.
//  Copyright © 2020 Reynaldi Wijaya. All rights reserved.
//

import UIKit

class LearnVC: UIViewController {
    
    @IBOutlet weak var learnCollectionView: UICollectionView!
    
    var learnView: LearnView { return self.view as! LearnView }
    
    
    override func loadView() {
        self.view = LearnView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    private func setupCollectionView() {
        self.learnCollectionView = learnView.learnCV
//        self.learnCollectionView.delegate = self
//        self.learnCollectionView.dataSource = self
        self.learnCollectionView.register(MenuCell.self, forCellWithReuseIdentifier: Constants.MENU_CELL_IDENTIFIER)
    }
}

//extension LearnVC: UICollectionViewDelegate, UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        <#code#>
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        <#code#>
//    }
//
//
//}
