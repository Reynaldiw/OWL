//
//  SignupPage.swift
//  Owl Onboarding
//
//  Created by Mohamad Naufal Nafian on 30/05/20.
//  Copyright © 2020 Mohamad Naufal Nafian. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class SignupPage: UIViewController, UITextFieldDelegate {
    
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
    
    let usernameTextField : UITextField = {
        let tf = UITextField()
        tf.layer.cornerRadius = 8
        tf.layer.borderWidth = 1
        tf.layer.borderColor = CGColor.rgb(red: 16, green: 120, blue: 149, alpha: 1)
        tf.placeholder = "username"
        tf.setLeftPaddingPoints(12)

        return tf
    }()
    
    let emailTextField : UITextField = {
        let tf = UITextField()
        tf.layer.cornerRadius = 8
        tf.layer.borderWidth = 1
        tf.layer.borderColor = CGColor.rgb(red: 16, green: 120, blue: 149, alpha: 1)
        tf.placeholder = "email"
        tf.setLeftPaddingPoints(12)

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

        return tf
    }()
    
    let errorLabel : UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .red
        return label
    }()
    

    
    let signupButton: UIButton = {
        let btn = UIButton()
        //btn.setTitle("Next", for: .normal)
        //btn.backgroundColor = .clear
        btn.layer.cornerRadius = 6
        btn.layer.borderWidth = 1
        btn.layer.borderColor = CGColor.rgb(red: 16, green: 120, blue: 149, alpha: 1)
        //btn.setTitleColor(UIColor.rgb(red: 25, green: 203, blue: 204, alpha: 1), for: .normal)
        //let origImage = UIImage(named: "email")
        //let tintedImage = origImage?.withRenderingMode(.alwaysTemplate)
        //btn.setImage(tintedImage, for: .normal)
        //btn.tintColor = .white
        
        //btn.setImage(UIImage(named: "apple"), for: .normal)
        
        
        btn.setTitle("Signup", for: .normal)
        btn.backgroundColor = UIColor.rgb(red: 16, green: 120, blue: 149, alpha: 1)
        btn.setTitleColor(UIColor.white, for: .normal)
        //btn.imageEdgeInsets = UIEdgeInsets(top: 10, left: 40, bottom: 10, right: 220)
        //btn.imageView?.contentMode = .scaleAspectFit
        //btn.imageView?.tintColor = .blue
        //btn.tintColor = .blue
        btn.addTarget(self, action: #selector(signupTapped), for: .touchUpInside)
        return btn
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
        usernameTextField.delegate = self
        //errorLabel.isHidden = true
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
           self.view.endEditing(true)
           return false
    }
    
    @objc func signupTapped() {
            //validate the fields
        let error = validateField()
        if error != nil {
            showError(error!)
        } else {
            //clean the first and lastname
            let username = usernameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            //create user
            Auth.auth().createUser(withEmail: email, password: password) { (res, err) in
                if err != nil {
                    //theres error
                    print(err)
                    self.showError("theres error")
                    
                } else {
                    
                    //user creation succes, now store username
                    let db = Firestore.firestore()
                    db.collection("users").addDocument(data: ["username":username, "uid":res?.user.uid]) { (err) in
                        if err != nil {
                            //show error massage
                            self.showError("error bro")
                        }
                    }   //transition to homescreen
                    let navController: UINavigationController = UINavigationController()
                    navController.viewControllers = [MainTabBarController()]
                    UIApplication.shared.windows.first?.rootViewController = navController
                }
                
            }
            
        }
    }
    
    
    func validateField () -> String? {
        if  usernameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            emailTextField.text?.trimmingCharacters(in:.whitespacesAndNewlines) == "" ||
            //pass.text?.trimmingCharacters(in:.whitespacesAndNewlines) == "" ||
            passwordTextField.text?.trimmingCharacters(in:.whitespacesAndNewlines) == ""
            {
            return "please insert all field"
            }
        
        let cleanedPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if Utilities.isPasswordValid(cleanedPassword) == false {
            //pass isnt safe
            return "please make sure ypur pass is secure"
        }
        
        return nil
        
    }
    
    func showError(_ massage : String) {
        errorLabel.text = massage
        errorLabel.alpha = 1
    }
    

    func setupLayout() {
        view.addSubview(ImageView)
        ImageView.anchor(top: view.topAnchor, bottom: view.bottomAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor, marginTop: 133, marginBottom: -486, marginLeading: 56, marginTrailing: -56, width: 0, height: 0, centerX: nil, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
        
        view.addSubview(usernameTextField)
        usernameTextField.anchor(top: ImageView.bottomAnchor, bottom: view.bottomAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor, marginTop: 84 , marginBottom: -358, marginLeading: 57, marginTrailing: -57, width: 0, height: 0, centerX: nil, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
        
        view.addSubview(emailTextField)
        emailTextField.anchor(top: usernameTextField.bottomAnchor, bottom: view.bottomAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor, marginTop: 14 , marginBottom: -300, marginLeading: 57, marginTrailing: -57, width: 0, height: 0, centerX: nil, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
        
        view.addSubview(passwordTextField)
        passwordTextField.anchor(top: emailTextField.bottomAnchor, bottom: nil, leading: nil, trailing: nil, marginTop: 14, marginBottom: 0, marginLeading: 0, marginTrailing: 0, width: 300, height: 44, centerX: view.centerXAnchor, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
        
        view.addSubview(signupButton)
        signupButton.anchor(top: passwordTextField.bottomAnchor, bottom: nil, leading: nil, trailing: nil, marginTop: 58, marginBottom: 0, marginLeading: 0, marginTrailing: 0, width: 300, height: 44, centerX: view.centerXAnchor, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
        
        view.addSubview(errorLabel)
        errorLabel.anchor(top: nil, bottom: signupButton.topAnchor, leading: nil, trailing: nil, marginTop: 0, marginBottom: -4, marginLeading: 0, marginTrailing: 0, width: 0, height: 0, centerX: view.centerXAnchor, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
    }
}

