//
//  ListOfMateriVC.swift
//  owl
//
//  Created by Reynaldi Wijaya on 13/06/20.
//  Copyright © 2020 Reynaldi Wijaya. All rights reserved.
//

import UIKit

class ListCategoryOfMateriVC: UIViewController {
    
    @IBOutlet weak var listOfMateriCollectionView: UICollectionView!
    
    var listView: ListCategoryOfMateriView { return self.view as! ListCategoryOfMateriView }
    
    var categoryModels = [CategoryMateriModel]()
    
    override func loadView() {
        self.view = ListCategoryOfMateriView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupNavigationView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
        
        categoryModels = CategoryMateriModel.getDummyData()
    }
    
    // Setup the profile button
    lazy var profileButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "profile"), for: .normal)
        button.addTarget(self, action: #selector(profileButtonTapped), for: .touchUpInside)
        return button
    }()
    
    @objc func profileButtonTapped() {}
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Basic Of Code"
        label.font = .boldSystemFont(ofSize: 21)
        label.textColor = Colors.bluePrimaryColor
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        return label
    }()
    
    fileprivate func setupNavigationView() {
        let leftButtonItem = UIBarButtonItem(customView: titleLabel)
        leftButtonItem.isEnabled = false
        leftButtonItem.tintColor = .black
        self.navigationItem.leftBarButtonItem = leftButtonItem
        
        let buttonItem = UIBarButtonItem(customView: profileButton)
        self.navigationItem.rightBarButtonItem = buttonItem
    }
    
    private func setupCollectionView() {
        self.listOfMateriCollectionView = listView.materisCollectionView
        self.listOfMateriCollectionView.delegate = self
        self.listOfMateriCollectionView.dataSource = self
        self.listOfMateriCollectionView.register(ListMateriCell.self, forCellWithReuseIdentifier: Constants.LIST_MATERI_CELL_IDENTIFIER)
        self.listOfMateriCollectionView.register(HeaderListMateriReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: Constants.HEADER_LIST_MATERI_IDENTIFIER)
    }
}

extension ListCategoryOfMateriVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.LIST_MATERI_CELL_IDENTIFIER, for: indexPath) as! ListMateriCell
        
        cell.categoryModel = categoryModels[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        MateriWireframe.moveToLearningMaterial(category: categoryModels[indexPath.row], caller: self)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width - 40, height: 40)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let view = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: Constants.HEADER_LIST_MATERI_IDENTIFIER, for: indexPath) as! HeaderListMateriReusableView

        return view
    }
    
}
