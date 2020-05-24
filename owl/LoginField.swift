//
//  LoginField.swift
//  Owl Onboarding
//
//  Created by Mohamad Naufal Nafian on 22/05/20.
//  Copyright © 2020 Mohamad Naufal Nafian. All rights reserved.
//

import UIKit

class LoginField: UIViewController {
    
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
        img.image = UIImage(named: "Illustration6")
        img.contentMode = .scaleAspectFill
        return img
    }()
    
    let emailTextField : UITextField = {
        let tf = UITextField()
        tf.layer.cornerRadius = 8
        tf.layer.borderWidth = 1
        tf.layer.borderColor = CGColor.rgb(red: 25, green: 203, blue: 204, alpha: 1)
        tf.placeholder = "email"
        tf.setLeftPaddingPoints(12)

        return tf
    }()
    
    let passwordTextField : UITextField = {
        let tf = UITextField()
        tf.layer.cornerRadius = 8
        tf.layer.borderWidth = 1
        tf.layer.borderColor = CGColor.rgb(red: 25, green: 203, blue: 204, alpha: 1)
        tf.placeholder = "password"
        tf.setLeftPaddingPoints(12)
        tf.isSecureTextEntry = true

        return tf
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
        //btn.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.rgb(red: 245, green: 245, blue: 245, alpha: 1)
        setupLayout()

        navigationController?.navigationBar.barTintColor = UIColor.rgb(red: 245, green: 245, blue: 245, alpha: 1)
        topLogoImage.sizeToFit()

        navigationItem.titleView = topLogoImage
        

        navigationController?.navigationBar.shadowImage = UIImage()

    }
    

    func setupLayout() {
        view.addSubview(ImageView)
        ImageView.anchor(top: view.topAnchor, bottom: view.bottomAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor, marginTop: 133, marginBottom: -486, marginLeading: 56, marginTrailing: -56, width: 0, height: 0, centerX: nil, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
        
        view.addSubview(emailTextField)
        emailTextField.anchor(top: ImageView.bottomAnchor, bottom: view.bottomAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor, marginTop: 84 , marginBottom: -358, marginLeading: 57, marginTrailing: -57, width: 0, height: 0, centerX: nil, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
        
        view.addSubview(passwordTextField)
        passwordTextField.anchor(top: emailTextField.bottomAnchor, bottom: view.bottomAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor, marginTop: 14 , marginBottom: -300, marginLeading: 57, marginTrailing: -57, width: 0, height: 0, centerX: nil, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
        
        view.addSubview(loginEmailButton)
        loginEmailButton.anchor(top: passwordTextField.bottomAnchor, bottom: view.bottomAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor, marginTop: 58, marginBottom: -198, marginLeading: 57, marginTrailing: -57, width: 0, height: 0, centerX: nil, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
    }
}
