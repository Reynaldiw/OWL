//
//  LoginField.swift
//  Owl Onboarding
//
//  Created by Mohamad Naufal Nafian on 22/05/20.
//  Copyright © 2020 Mohamad Naufal Nafian. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class LoginField: UIViewController, UITextFieldDelegate {
    
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
        tf.layer.borderColor = CGColor.rgb(red: 16, green: 120, blue: 149, alpha: 1)
        tf.placeholder = "email"
        tf.setLeftPaddingPoints(12)
        tf.returnKeyType = UIReturnKeyType.done
        tf.keyboardType = UIKeyboardType.default

        return tf
    }()
    
    let passwordTextField : UITextField = {
        let tf = UITextField()
        tf.layer.cornerRadius = 8
        tf.layer.borderWidth = 1
        tf.layer.borderColor = CGColor.rgb(red: 16, green: 120, blue: 149, alpha: 1)
        tf.placeholder = "password"
        tf.setLeftPaddingPoints(12)
        tf.isSecureTextEntry = true
        tf.returnKeyType = UIReturnKeyType.done

        return tf
    }()
    
    let loginEmailButton: UIButton = {
        let btn = UIButton()
        btn.layer.cornerRadius = 6
        btn.layer.borderWidth = 1
        btn.layer.borderColor = CGColor.rgb(red: 16, green: 120, blue: 149, alpha: 1)
        btn.setTitle("Login", for: .normal)
        btn.backgroundColor = UIColor.rgb(red: 16, green: 120, blue: 149, alpha: 1)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
        return btn
    }()
    
    let errorLabel: UILabel = {
        let label = UILabel()
        label.textColor = .red
        label.font = UIFont.systemFont(ofSize: 12)
        
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.rgb(red: 237, green: 241, blue: 242, alpha: 1)
        setupLayout()

        navigationController?.navigationBar.barTintColor = UIColor.rgb(red: 237, green: 241, blue: 242, alpha: 1)
        topLogoImage.sizeToFit()

        navigationItem.titleView = topLogoImage
        

        navigationController?.navigationBar.shadowImage = UIImage()
        emailTextField.delegate = self
        passwordTextField.delegate = self

    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
           self.view.endEditing(true)
           return false
    }
    
    @objc func loginTapped() {
        let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        
        //signing in the user
        Auth.auth().signIn(withEmail: email, password: password) { (res, err) in
            if err != nil {
                self.errorLabel.text = err!.localizedDescription
                self.errorLabel.alpha = 1
            } else {
                let navController: UINavigationController = UINavigationController()
                navController.viewControllers = [MainTabBarController()]
                UIApplication.shared.windows.first?.rootViewController = navController
            }
        }
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
        
        view.addSubview(errorLabel)
        errorLabel.anchor(top: nil, bottom: loginEmailButton.topAnchor, leading: nil, trailing: nil, marginTop: 0, marginBottom: -4, marginLeading: 0, marginTrailing: 0, width: 0, height: 0, centerX: view.centerXAnchor, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
    }
}
