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
    
//    var categoryLearnModels = [CategoryLearnModel]()
//    var topicLearnModels = [TopicLearnModel]()
    
//    var request: LearnService?
    
    var topicLearnModels = [DummyTopicLearnModel]()
    var categoryLearnModels = [DummyCategoryLearnModel]()
    
    override func loadView() {
        self.view = LearnView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupNavigationItem()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        
//        request = LearnRepository()
        
        categoryLearnModels = DummyCategoryLearnModel.getDummyCategoryLearn()

    }
    
    private func setupCollectionView() {
        self.learnCollectionView = learnView.learnCV
        self.learnCollectionView.delegate = self
        self.learnCollectionView.dataSource = self
        self.learnCollectionView.register(MenuCell.self, forCellWithReuseIdentifier: Constants.MENU_CELL_IDENTIFIER)
        self.learnCollectionView.register(HeaderCategoryLearnReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: Constants.HEADER_CATEGORY_REUSABLE_IDENTIFIER)
    }
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Class"
        label.font = .boldSystemFont(ofSize: 21)
        label.textColor = Colors.bluePrimaryColor
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        return label
    }()
    
    // Setup the profile button
    let profileButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "profile"), for: .normal)
        button.addTarget(self, action: #selector(profileButtonTapped), for: .touchUpInside)
        return button
    }()
    
    @objc func profileButtonTapped() {}
    
    private func setupNavigationItem() {
        // Clear background navigation
            self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default) //UIImage.init(named: "transparent.png")
            self.navigationController?.navigationBar.shadowImage = UIImage()
            self.navigationController?.navigationBar.isTranslucent = true
            self.navigationController?.view.backgroundColor = .clear
            
            let leftButtonItem = UIBarButtonItem(customView: titleLabel)
            leftButtonItem.isEnabled = false
            leftButtonItem.tintColor = Colors.bluePrimaryColor
            self.navigationItem.leftBarButtonItem = leftButtonItem
        
            let buttonItem = UIBarButtonItem(customView: profileButton)
            self.navigationItem.rightBarButtonItem = buttonItem
    }
}

extension LearnVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return categoryLearnModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryLearnModels[section].topics?.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.MENU_CELL_IDENTIFIER, for: indexPath) as! MenuCell
        
        let categoryLearnModel = categoryLearnModels[indexPath.section]
        let topicLearnModel = categoryLearnModel.topics?[indexPath.item]
        
        cell.imageView.image = UIImage(named: topicLearnModel?.imageName ?? "")
        cell.titleLabel.text = topicLearnModel?.title
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let reusableView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: Constants.HEADER_CATEGORY_REUSABLE_IDENTIFIER, for: indexPath) as! HeaderCategoryLearnReusableView
        
        reusableView.titleLabel.text = categoryLearnModels[indexPath.section].title
        
        return reusableView
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (learnCollectionView.frame.width - 100) / 4
        return CGSize(width: width, height: 82)
    }
}

//extension LearnVC {
//    private func saveData() {
//        let dummyCategoryLearnModels = DummyCategoryLearnModel.getDummyCategoryLearn()
//        var dummyTopicLearnModels: [DummyTopicLearnModel]?
//
//        for i in dummyCategoryLearnModels {
//            if let topicModel = i.topic {
//                dummyTopicLearnModels?.append(topicModel)
//            }
//        }
//
//        for i in 0...dummyCategoryLearnModels.count - 1 {
//            let newModelTopic = TopicLearnModel(context: PersistenceService.context)
//            let newModelCategory = CategoryLearnModel(context: PersistenceService.context)
//        }
//    }
//
//    private func checkData() {
//        request?.getLocalCategoryLearnModel(onSuccess: { (models) in
//            if models.count > 0 {
//                self.categoryLearnModels = models
//                self.learnCollectionView.reloadData()
//            } else {
//                self.saveData()
//            }
//        }, onFailed: { (message) in
//            print(message)
//        })
//
//    }
//}
