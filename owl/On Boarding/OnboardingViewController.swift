//
//  OnboardingViewController.swift
//  Owl Onboarding
//
//  Created by Mohamad Naufal Nafian on 21/05/20.
//  Copyright © 2020 Mohamad Naufal Nafian. All rights reserved.
//

import UIKit


struct Page {
    
    let imageName: String
    let headerText: String
    let description: String
}


class OnboardingViewController: UIViewController {
    
    let pages = [
    Page(imageName: "OWL-Icon", headerText: "Welcome to OWL", description: "An app that allow you to Learn, Explore and Teach each other by your on own learning."),
    Page(imageName: "Illustration", headerText: "Learn", description: "Find you most interest education, take the challenge and do it yourself."),
    Page(imageName: "Illustration2", headerText: "Explore", description: "Explore any education and challenge that relate to your own education."),
    Page(imageName: "Illustration3", headerText: "Teach", description: "Get another knowledge by teaching each other.")
    ]
    
    let collectionView : UICollectionView = {
    
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .horizontal
    
        let cv = UICollectionView(frame: .zero , collectionViewLayout: layout)
        cv.backgroundColor = UIColor.rgb(red: 245, green: 245, blue: 245, alpha: 1)
        return cv
    }()
    
    
    lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = pages.count
        pc.currentPageIndicatorTintColor = UIColor.rgb(red: 25, green: 203, blue: 204, alpha: 1)
        pc.pageIndicatorTintColor = UIColor.rgb(red: 176, green: 255, blue: 251, alpha: 1)
        return pc
    }()
    
    let nextButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Next", for: .normal)
        btn.backgroundColor = .clear
        btn.layer.cornerRadius = 15
        btn.layer.borderWidth = 1
        btn.layer.borderColor = CGColor.rgb(red: 25, green: 203, blue: 204, alpha: 1)
        btn.setTitleColor(UIColor.rgb(red: 25, green: 203, blue: 204, alpha: 1), for: .normal)
        btn.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        

        return btn
    }()
    
    @objc func handleNext() {
        let nextIndex = min(pageControl.currentPage + 1, pages.count - 1)
        let indexPath = IndexPath(item: nextIndex, section: 0)
        pageControl.currentPage = nextIndex
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        pageControl.currentPage = nextIndex
        
        if pageControl.currentPage == pages.count-1 {
            nextButton.setTitle("Get Started", for: .normal)
            nextButton.backgroundColor = UIColor.rgb(red: 25, green: 203, blue: 204, alpha: 1)
            nextButton.setTitleColor(UIColor.white, for: .normal)
            let vc = MainTabBar()
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
        //print("current page", pageControl.currentPage)
    }
    

    
     func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {

        let x = targetContentOffset.pointee.x

        pageControl.currentPage = Int(x / view.frame.width)
        print("current page", pageControl.currentPage)
        
        if pageControl.currentPage == pages.count-1 {
            nextButton.setTitle("Get Started", for: .normal)
            nextButton.backgroundColor = UIColor.rgb(red: 25, green: 203, blue: 204, alpha: 1)
            nextButton.setTitleColor(UIColor.white, for: .normal)
        } else {
            nextButton.setTitle("Next", for: .normal)
            nextButton.backgroundColor = UIColor.clear
            nextButton.setTitleColor(UIColor.rgb(red: 25, green: 203, blue: 204, alpha: 1), for: .normal)
        }

    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        view.backgroundColor = UIColor.rgb(red: 245, green: 245, blue: 245, alpha: 1)
        // Do any additional setup after loading the view.
        collectionView.register(OnboardingViewCell.self, forCellWithReuseIdentifier: "cellid")
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.isPagingEnabled = true
        //set collection view constrain in view
        view.addSubview(collectionView)
        collectionView.anchor(top: view.topAnchor, bottom: view.bottomAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor, marginTop: -10, marginBottom: 0, marginLeading: 0, marginTrailing: 0, width: 0, height: 0, centerX: nil, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
        
        view.addSubview(pageControl)
        pageControl.anchor(top: view.topAnchor, bottom: nil, leading: nil, trailing: nil, marginTop: 684, marginBottom: -202, marginLeading: 172, marginTrailing: -172, width: 70, height: 10, centerX: view.centerXAnchor, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
        
        view.addSubview(nextButton)
        nextButton.anchor(top: pageControl.bottomAnchor, bottom: view.bottomAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor, marginTop: 72, marginBottom: -75, marginLeading: 85, marginTrailing: -85, width: 0, height: 0, centerX: nil, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
    }

}


extension OnboardingViewController : UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    

   
    // amount of collection view cell
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    //set the collectionviewcell properties
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellid", for: indexPath) as! OnboardingViewCell
        //cell.backgroundColor = .yellow
        cell.page = pages[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    
}
