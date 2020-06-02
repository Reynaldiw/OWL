//
//  NotificationViewController.swift
//  Owl Onboarding
//
//  Created by Mohamad Naufal Nafian on 02/06/20.
//  Copyright © 2020 Mohamad Naufal Nafian. All rights reserved.
//

import UIKit

class NotificationViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

    
    let labelTitle : UILabel = {
        let label = UILabel()
        label.text = "Notification"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = UIColor.rgb(red: 19, green: 134, blue: 167, alpha: 1)
        return label
    }()
    
    let collectionView : UICollectionView = {
    
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 30
        layout.scrollDirection = .vertical
    
        let cv = UICollectionView(frame: .zero , collectionViewLayout: layout)
        cv.backgroundColor = UIColor.rgb(red: 237, green: 241, blue: 242, alpha: 1)
        return cv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.rgb(red: 237, green: 241, blue: 242, alpha: 1)
        view.insetsLayoutMarginsFromSafeArea = false
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: labelTitle)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.barTintColor = UIColor.rgb(red: 237, green: 241, blue: 242, alpha: 1)

        setupView()
        collectionView.register(DetailedNotif.self, forCellWithReuseIdentifier: "cellid")
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    func setupView () {
        
        view.addSubview(collectionView)
        collectionView.anchor(top: view.topAnchor, bottom: view.bottomAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor, marginTop: 0, marginBottom: 0, marginLeading: 0, marginTrailing: 0, width: 0, height: 0, centerX: nil, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
        collectionView.insetsLayoutMarginsFromSafeArea = false
       
    }
    

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellid", for: indexPath) as! DetailedNotif
        
        cell.backgroundColor = .clear
        
        return cell
    }
    
        //SIZE FOR ITEM AT --> setting ukuran masing-masing cell dalam section
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 340, height: 66)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return  UIEdgeInsets(top: 4, left: 8, bottom: 4, right: 8)
    }
    
}

class DetailedNotif: UICollectionViewCell {
    
    
    let image : UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "imagepopularclass1")
        image.contentMode = .scaleToFill
        
        return image
    }()
    
    let notifText : UILabel = {
        let label = UILabel()
        label.text = "Dont forget to join the live class Connect ML Core and Core Data with Brian Kvovalsky"
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    let notifTime : UILabel = {
        let label = UILabel()
        label.text = "10 minutes ago"
        //label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 8)
        label.textColor = .gray
        return label
    }()

    
 
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }
    
    func setupCell() {
        addSubview(image)
        image.anchor(top: nil, bottom: nil, leading: leadingAnchor, trailing: nil, marginTop: 0, marginBottom: 0, marginLeading: 0, marginTrailing: 0, width: 60, height: 60, centerX: nil, centerY: centerYAnchor, marginFromCenterX: 0, marginFromCenterY: 0)
        
        addSubview(notifText)
        notifText.anchor(top: topAnchor, bottom: nil, leading: image.trailingAnchor, trailing: trailingAnchor, marginTop: 8, marginBottom: 0, marginLeading: 4, marginTrailing: -8, width: 0, height: 0, centerX: nil, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
        
        addSubview(notifTime)
        notifTime.anchor(top: nil, bottom: bottomAnchor, leading: image.trailingAnchor, trailing: nil, marginTop: 0, marginBottom: 0, marginLeading: 4, marginTrailing: 0, width: 0, height: 0, centerX: nil, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
}

