//
//  LoginScreen.swift
//  Owl Onboarding
//
//  Created by Mohamad Naufal Nafian on 21/05/20.
//  Copyright © 2020 Mohamad Naufal Nafian. All rights reserved.
//

import UIKit

class LoginScreen: UIViewController {
    
    let topLogoImage : UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "OWL-Icon")
        img.frame = CGRect(x: 0, y: 0, width: 50, height: 2)
        img.contentMode = .scaleAspectFit
        img.sizeToFit()
        return img
    }()
    
    let ImageView : UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "Illustration4")
        img.contentMode = .scaleAspectFill
        return img
    }()
    
    let pageTitle : UILabel = {
        let label = UILabel()
        label.text = "Stay keep in touch with us with login"
        label.numberOfLines = 2
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()
    
    let loginAppleButton: UIButton = {
        let btn = UIButton()
        //btn.setTitle("Next", for: .normal)
        //btn.backgroundColor = .clear
        btn.layer.cornerRadius = 6
        ////btn.layer.borderWidth = 1
        btn.layer.borderColor = CGColor.rgb(red: 25, green: 203, blue: 204, alpha: 1)
        //btn.setTitleColor(UIColor.rgb(red: 25, green: 203, blue: 204, alpha: 1), for: .normal)
        let origImage = UIImage(named: "apple")
        let tintedImage = origImage?.withRenderingMode(.alwaysTemplate)
        btn.setImage(tintedImage, for: .normal)
        btn.tintColor = .white
        
        //btn.setImage(UIImage(named: "apple"), for: .normal)
        
        
        btn.setTitle("Signin with Apple ID", for: .normal)
        btn.backgroundColor = UIColor.black
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.imageEdgeInsets = UIEdgeInsets(top: 10, left: 40, bottom: 10, right: 220)
        btn.imageView?.contentMode = .scaleAspectFit
        //btn.imageView?.tintColor = .blue
        //btn.tintColor = .blue
        //btn.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        

        return btn
    }()
    
    let loginEmailButton: UIButton = {
        let btn = UIButton()
        //btn.setTitle("Next", for: .normal)
        //btn.backgroundColor = .clear
        btn.layer.cornerRadius = 6
        btn.layer.borderWidth = 1
        btn.layer.borderColor = CGColor.rgb(red: 25, green: 203, blue: 204, alpha: 1)
        //btn.setTitleColor(UIColor.rgb(red: 25, green: 203, blue: 204, alpha: 1), for: .normal)
        let origImage = UIImage(named: "email")
        let tintedImage = origImage?.withRenderingMode(.alwaysTemplate)
        btn.setImage(tintedImage, for: .normal)
        btn.tintColor = .white
        
        //btn.setImage(UIImage(named: "apple"), for: .normal)
        
        
        btn.setTitle("Signin with Email", for: .normal)
        btn.backgroundColor = UIColor.rgb(red: 25, green: 203, blue: 204, alpha: 1)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.imageEdgeInsets = UIEdgeInsets(top: 10, left: 40, bottom: 10, right: 220)
        btn.imageView?.contentMode = .scaleAspectFit
        //btn.imageView?.tintColor = .blue
        //btn.tintColor = .blue
        btn.addTarget(self, action: #selector(loginEmail), for: .touchUpInside)
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.rgb(red: 245, green: 245, blue: 245, alpha: 1)
        setupLayout()

        navigationController?.navigationBar.barTintColor = UIColor.rgb(red: 245, green: 245, blue: 245, alpha: 1)
        topLogoImage.sizeToFit()
        //topLogoImage.frame = CGRect(x: 50, y: 20, width: 40, height: 20)
        navigationItem.titleView = topLogoImage
        
        //remove shadow effect
        //navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.plain, target:nil, action:nil)

    }
    
    @objc func loginEmail() {
        navigationController?.pushViewController(LoginField(), animated: true)
    }
    


    
    func setupLayout() {
        
        view.addSubview(ImageView)
        ImageView.anchor(top: view.topAnchor, bottom: view.bottomAnchor, leading: nil, trailing: view.trailingAnchor, marginTop: 148, marginBottom: -365, marginLeading: 0, marginTrailing: -20, width: 0, height: 0, centerX: nil, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
        
        view.addSubview(pageTitle)
        pageTitle.anchor(top: ImageView.bottomAnchor, bottom: view.bottomAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor, marginTop: 0, marginBottom: -315, marginLeading: 90, marginTrailing: -90, width: 0, height: 0, centerX: view.centerXAnchor, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)

        view.addSubview(loginAppleButton)
        loginAppleButton.anchor(top: pageTitle.bottomAnchor, bottom: view.bottomAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor, marginTop: 72, marginBottom: -199, marginLeading: 57, marginTrailing: -57, width: 0, height: 0, centerX: view.centerXAnchor, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
        
        view.addSubview(loginEmailButton)
        loginEmailButton.anchor(top: loginAppleButton.bottomAnchor, bottom: view.bottomAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor, marginTop: 33, marginBottom: -122, marginLeading: 57, marginTrailing: -57, width: 0, height: 0, centerX: nil, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
    }
    

}
