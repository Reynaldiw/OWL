//
//  LearningMaterialVC.swift
//  owl
//
//  Created by Reynaldi Wijaya on 15/06/20.
//  Copyright © 2020 Reynaldi Wijaya. All rights reserved.
//

import UIKit

class LearningMaterialVC: UIViewController {
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var listOfLearningMaterialCollectionView: UICollectionView!
    
    var learningMaterialView: LearningMaterialView { return self.view as! LearningMaterialView }
    
    var categoryMateriModel: CategoryMateriModel?
    
    var learningMateriModels = [LearningMaterialModel]()
        
    override func loadView() {
        self.view = LearningMaterialView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupNavigationItem()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        segmentedControl = learningMaterialView.segmentedControl
        segmentedControl.addTarget(self, action: #selector(handleSegmentedControlValueChanged(_:)), for: .valueChanged)
        
        setupCollectionView()
        
        learningMateriModels = LearningMaterialModel.getDummyData()
    }
    
    @objc fileprivate func handleSegmentedControlValueChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            learningMaterialView.listOfLearningMaterialView.isHidden = false
        case 1:
            learningMaterialView.listOfLearningMaterialView.isHidden = true
        case 2:
            learningMaterialView.listOfLearningMaterialView.isHidden = true
        default:
            return
        }
    }
    
    fileprivate func setupNavigationItem() {
        title = categoryMateriModel?.title
    }
    
    private func setupCollectionView() {
        listOfLearningMaterialCollectionView = learningMaterialView.listOfLearningMaterialView.learningMaterialCV
        listOfLearningMaterialCollectionView.delegate = self
        listOfLearningMaterialCollectionView.dataSource = self
        listOfLearningMaterialCollectionView.register(LearningMaterialCell.self, forCellWithReuseIdentifier: Constants.LEARNING_MATERIAL_CELL_IDENTIFIER)
    }
}

extension LearningMaterialVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        learningMateriModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.LEARNING_MATERIAL_CELL_IDENTIFIER, for: indexPath) as! LearningMaterialCell
        
        cell.learningMaterialModel = learningMateriModels[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = listOfLearningMaterialCollectionView.frame.width
        
        return CGSize(width: width - 60, height: 60)
    }
    
}
