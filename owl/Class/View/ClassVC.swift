//
//  DashboardVC.swift
//  owl
//
//  Created by Reynaldi Wijaya on 24/05/20.
//  Copyright © 2020 Reynaldi Wijaya. All rights reserved.
//

import UIKit

class ClassVC: UIViewController {
    
    @IBOutlet weak var interestCollectionView: UICollectionView!
    @IBOutlet weak var popularLiveClassCollectionView: UICollectionView!
    @IBOutlet weak var popularProjectCollectionView: UICollectionView!
    
    @IBOutlet weak var menuCollectionView: UICollectionView!
    
    var classView: ClassView { return self.view as! ClassView }
    
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
    
    var menuModels = [MenuModel]()
    var liveModels = [LiveClassModel]()
    var projectModels = [ProjectModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationItem()
        
        menuModels = MenuModel.getDummyMenuModel()
        liveModels = LiveClassModel.getDummyLiveClassModel()
        projectModels = ProjectModel.getDummyProjectModel()
        
        setupCollectionView()
    }
    
    override func loadView() {
        self.view = ClassView()
    }
    
    // Setup the navigation
    func setupNavigationItem() {
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
    
    @objc func profileButtonTapped() {}
    
    func setupCollectionView() {
        self.menuCollectionView = classView.menuCollectionView
        self.menuCollectionView.delegate = self
        self.menuCollectionView.dataSource = self
        self.menuCollectionView.register(MenuCell.self, forCellWithReuseIdentifier: Constants.INTEREST_CELL_IDENTIFIER)
        
        self.popularLiveClassCollectionView = classView.popularLiveClassView.liveClassCV
        self.popularLiveClassCollectionView.delegate = self
        self.popularLiveClassCollectionView.dataSource = self
        self.popularLiveClassCollectionView.register(LiveClassCell.self, forCellWithReuseIdentifier: Constants.LIVE_CLASS_CELL_IDENTIFIEL)

        // Setup Popular Challenges CV
        self.popularProjectCollectionView = classView.popularProjectView.projectCV
        self.popularProjectCollectionView.delegate = self
        self.popularProjectCollectionView.dataSource = self
        self.popularProjectCollectionView.register(ProjectCell.self, forCellWithReuseIdentifier: Constants.PROJECT_CELL_IDENTIFIER)
    }
}

extension ClassVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == popularLiveClassCollectionView { return liveModels.count }
        if collectionView == popularProjectCollectionView { return projectModels.count }
        return menuModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == popularLiveClassCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.LIVE_CLASS_CELL_IDENTIFIEL, for: indexPath) as! LiveClassCell
            
            cell.liveClassModel = liveModels[indexPath.row]
            
            return cell
        }
        
        if collectionView == popularProjectCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.PROJECT_CELL_IDENTIFIER, for: indexPath) as! ProjectCell
            
            cell.model = projectModels[indexPath.row]
            
            return cell
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.INTEREST_CELL_IDENTIFIER, for: indexPath) as! MenuCell
        
        let menuModel = menuModels[indexPath.row]
        
        cell.imageView.image = menuModel.imagePosterView
        cell.titleLabel.text = menuModel.title
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == popularLiveClassCollectionView {
            return CGSize(width: 275, height: 100)
        }
        
        if collectionView == popularProjectCollectionView {
            return CGSize(width: 175, height: 175)
        }
        
        let width = (menuCollectionView.frame.width - 100) / 4
        return CGSize(width: width, height: 80)
    }
}
