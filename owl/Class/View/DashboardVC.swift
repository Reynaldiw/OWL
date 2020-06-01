//
//  DashboardVC.swift
//  owl
//
//  Created by Reynaldi Wijaya on 24/05/20.
//  Copyright © 2020 Reynaldi Wijaya. All rights reserved.
//

import UIKit

class DashboardVC: UIViewController {
    
    @IBOutlet weak var interestCollectionView: UICollectionView!
    @IBOutlet weak var popularChallengesCollectionView: UICollectionView!
    
    var dashboardView: DashboardView { return self.view as! DashboardView }
    
    var interestModels = [InterestMenuModel]()
    var challengeModels = [ChallengeModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationItem()
        
        addDataModels()
        setupCollectionView()
    }
    
    override func loadView() {
        self.view = DashboardView()
    }
    
    // Setup the navigation
    func setupNavigationItem() {
        // Setup the title image
        let icon = UIImage(named: "OWL-Icon")
        let image = UIImageView(image: icon)
        image.contentMode = .scaleAspectFit
        self.navigationItem.titleView = image
        
        // Setup the profile button
        let profileButton: UIButton = {
            let button = UIButton()
            button.setImage(UIImage(named: "profile"), for: .normal)
            button.addTarget(self, action: #selector(profileButtonTapped), for: .touchUpInside)
            return button
        }()
        let buttonItem = UIBarButtonItem(customView: profileButton)
        self.navigationItem.rightBarButtonItem = buttonItem
    }
    
    @objc func profileButtonTapped() {}
    
    func addDataModels() {
        let dummyOverview = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
        
        let model = InterestMenuModel(id: 1, imageNamed: "mathMenu", titleMenu: "Math", overview: dummyOverview, rating: 7.0, totalStudents: 300)
        interestModels.append(model)
        let model2 = InterestMenuModel(id: 2, imageNamed: "computerMenu", titleMenu: "Computer", overview: dummyOverview, rating: 7.0, totalStudents: 300)
        interestModels.append(model2)
        let model3 = InterestMenuModel(id: 3, imageNamed: "scienceMenu", titleMenu: "Science", overview: dummyOverview, rating: 7.0, totalStudents: 300)
        interestModels.append(model3)
        let model4 = InterestMenuModel(id: 4, imageNamed: "marketingMenu", titleMenu: "Marketing", overview: dummyOverview, rating: 7.0, totalStudents: 300)
        interestModels.append(model4)
        let model5 = InterestMenuModel(id: 5, imageNamed: "cookingMenu", titleMenu: "Cooking", overview: dummyOverview, rating: 7.0, totalStudents: 300)
        interestModels.append(model5)
        
        // Setup Challenge Model
        let modelChallenge = ChallengeModel(id: 1, idInterestMenu: 2, imageNamed: "dummyChallenge", topic: "Computer", subTopic: "Coding", title: "Make simpel augmented reality app using swift", level: "Intermediate", time: "15 Hours", students: 128, rating: 7.8, overview: dummyOverview)
        let modelChallenge2 = ChallengeModel(id: 2, idInterestMenu: 4, imageNamed: "dummyChallenge2", topic: "Marketing", subTopic: "Social Media", title: "Easy to grow up instagram account for business", level: "Beginner", time: "8 Hours", students: 128, rating: 7.8, overview: dummyOverview)
        let modelChallenge3 = ChallengeModel(id: 1, idInterestMenu: 2, imageNamed: "dummyChallenge", topic: "Computer", subTopic: "Coding", title: "Make simpel augmented reality app using swift", level: "Intermediate", time: "15 Hours", students: 128, rating: 7.8, overview: dummyOverview)
        let modelChallenge4 = ChallengeModel(id: 2, idInterestMenu: 4, imageNamed: "dummyChallenge2", topic: "Marketing", subTopic: "Social Media", title: "Easy to grow up instagram account for business And Othere Social Media", level: "Beginner", time: "8 Hours", students: 128, rating: 7.8, overview: dummyOverview)
        challengeModels.append(modelChallenge)
        challengeModels.append(modelChallenge2)
        challengeModels.append(modelChallenge3)
        challengeModels.append(modelChallenge4)
        
    }
    
    func setupCollectionView() {
        // Setup Interest CV
        self.interestCollectionView = dashboardView.interestEducationView.interestCollectionView
        self.interestCollectionView.delegate = self
        self.interestCollectionView.dataSource = self
        self.interestCollectionView.register(InterestCell.self, forCellWithReuseIdentifier: Constants.INTEREST_CELL_IDENTIFIER)
        
        // Setup Popular Challenges CV
        self.popularChallengesCollectionView = dashboardView.popularChallengeView.popularChallengesCV
        self.popularChallengesCollectionView.delegate = self
        self.popularChallengesCollectionView.dataSource = self
        self.popularChallengesCollectionView.register(ChallengeCell.self, forCellWithReuseIdentifier: Constants.CHALLENGE_CELL_IDENTIFIER)
    }
}

extension DashboardVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == popularChallengesCollectionView {
            return challengeModels.count
        }
        
        return interestModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == popularChallengesCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.CHALLENGE_CELL_IDENTIFIER, for: indexPath) as! ChallengeCell

            cell.model = challengeModels[indexPath.row]

            return cell
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.INTEREST_CELL_IDENTIFIER, for: indexPath) as! InterestCell
        
        cell.model = interestModels[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == popularChallengesCollectionView {
            return CGSize(width: 190, height: 220)
        }
        return CGSize(width: 80, height: 80)
    }
}
