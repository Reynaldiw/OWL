//
//  LearnController.swift
//  Owl Onboarding
//
//  Created by Mohamad Naufal Nafian on 02/06/20.
//  Copyright © 2020 Mohamad Naufal Nafian. All rights reserved.
//

import UIKit

class LearnViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

    
    let labelTitle : UILabel = {
        let label = UILabel()
        label.text = "Learn"
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
        
        collectionView.register(DetailedLearn.self, forCellWithReuseIdentifier: "cellid")
        collectionView.dataSource = self
        collectionView.delegate = self
        setupView()
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellid", for: indexPath) as! DetailedLearn
        
        cell.backgroundColor = .clear
        return cell
    }

    
        //SIZE FOR ITEM AT --> setting ukuran masing-masing cell dalam section
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width - 16, height: 120)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return  UIEdgeInsets(top: 4, left: 8, bottom: 4, right: 8)
    }
    

}



class DetailedLearn : UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

    let cellId = "cellId"
    
    let titleLabel : UILabel = {
        let label = UILabel()
        label.text = "Language Programming"
        label.textColor = UIColor.rgb(red: 16, green: 120, blue: 149, alpha: 1)
        label.font = UIFont.boldSystemFont(ofSize: 13)
        return label
        
    }()
    
    let rectangle : UIView = {
        let rec = UIView()
        rec.backgroundColor = UIColor.rgb(red: 16, green: 120, blue: 149, alpha: 1)
        return rec
    }()
//
    let collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 12
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        
        return cv
    }()
    
     override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
        }
    
    func setupCell() {
        backgroundColor = .clear
        addSubview(collectionView)
        collectionView.anchor(top: topAnchor, bottom: bottomAnchor, leading: leadingAnchor, trailing: trailingAnchor, marginTop: 30, marginBottom: -4, marginLeading: 4, marginTrailing: -4, width: 0, height: 0, centerX: nil, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)

        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(myPresent.self , forCellWithReuseIdentifier: cellId)
        collectionView.showsHorizontalScrollIndicator = false
        
        addSubview(rectangle)
        rectangle.anchor(top: topAnchor, bottom: nil, leading: leadingAnchor, trailing: nil, marginTop: 0, marginBottom: 0, marginLeading: 0, marginTrailing: 0, width: 3, height: 20, centerX: nil, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
        
        addSubview(titleLabel)
        titleLabel.anchor(top: topAnchor, bottom: nil, leading: rectangle.leadingAnchor, trailing: nil, marginTop: 3, marginBottom: 0, marginLeading: 6, marginTrailing: 0, width: 0, height: 0, centerX: nil, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
//
//
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        6
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! myPresent
        return cell
    }
//
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 82, height: 82)
    }
//
    
    
//
     private class myPresent : UICollectionViewCell {
        
        let container : UIView = {
            let ctnr = UIView()
            ctnr.backgroundColor = .white
            ctnr.layer.cornerRadius = 10
            //ctnr.layer.shadowColor = CGColor.rgb(red: 0, green: 0, blue: 0, alpha: 1)
            ctnr.layer.applySketchShadow(color: .black, alpha: 0.11, x: -1, y: 2, blur: 3, spread: 0)
            
            return ctnr
        }()
        
        let image : UIImageView = {
            let image = UIImageView()
            image.image = UIImage(named: "swift")
            image.contentMode = .scaleAspectFit
            
            return image
        }()
        
        let title : UILabel = {
            let label = UILabel()
            label.text = "Swift"
            label.font = UIFont.systemFont(ofSize: 10)
            label.textColor = UIColor.rgb(red: 16, green: 120, blue: 149, alpha: 1)
            
            return label
        }()
        

        override init(frame: CGRect) {
            super.init(frame:frame)
            backgroundColor = .clear
            setupInside()
        }
        
        func setupInside() {
            addSubview(container)
            container.anchor(top: nil, bottom: nil, leading: nil, trailing: nil, marginTop: 0, marginBottom: 0, marginLeading: 0, marginTrailing: 0, width: 82, height: 82, centerX: centerXAnchor, centerY: centerYAnchor, marginFromCenterX: 0, marginFromCenterY: 0)
            
            addSubview(image)
            image.anchor(top: nil, bottom: nil, leading: nil, trailing: nil, marginTop: 0, marginBottom: 0, marginLeading: 0, marginTrailing: 0, width: 40, height: 40, centerX: centerXAnchor, centerY: centerYAnchor, marginFromCenterX: 0, marginFromCenterY: -10)
            
            addSubview(title)
            title.anchor(top: image.bottomAnchor, bottom: nil, leading: nil, trailing: nil, marginTop: 10, marginBottom: 0, marginLeading: 0, marginTrailing: 0, width: 0, height: 0, centerX: centerXAnchor, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
            
        }
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
    

}

