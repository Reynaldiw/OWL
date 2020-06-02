//
//  LoginScreen.swift
//  Owl Onboarding
//
//  Created by Mohamad Naufal Nafian on 21/05/20.
//  Copyright © 2020 Mohamad Naufal Nafian. All rights reserved.
//

import UIKit
import AuthenticationServices
import CryptoKit
import FirebaseAuth
import Firebase

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
    
    let loginAppleButton: ASAuthorizationAppleIDButton = {
        let btn = ASAuthorizationAppleIDButton()
        btn.layer.cornerRadius = 6
        btn.clipsToBounds = true
        //btn.layer.borderColor = CGColor.rgb(red: 25, green: 203, blue: 204, alpha: 1)
        btn.backgroundColor = UIColor.black
        btn.addTarget(self, action: #selector(tapAppleButton), for: .touchUpInside)
        return btn
    }()
    
    let loginEmailButton: UIButton = {
        let btn = UIButton()
        btn.layer.cornerRadius = 6
        btn.layer.borderWidth = 1
        btn.layer.borderColor = CGColor.rgb(red: 16, green: 120, blue: 149, alpha: 1)
        let origImage = UIImage(named: "email")
        let tintedImage = origImage?.withRenderingMode(.alwaysTemplate)
        btn.setImage(tintedImage, for: .normal)
        btn.tintColor = .white
        btn.setTitle("Signin with Email", for: .normal)
        btn.backgroundColor = UIColor.rgb(red: 16, green: 120, blue: 149, alpha: 1)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.imageEdgeInsets = UIEdgeInsets(top: 14, left: 68, bottom: 14, right: 220)
        btn.imageView?.contentMode = .scaleAspectFit
        btn.addTarget(self, action: #selector(loginEmail), for: .touchUpInside)
        return btn
    }()
    
    let signupButton : UIButton = {
        let btn = UIButton()
        btn.setTitle("signup here!", for: .normal)
        btn.setTitleColor(UIColor.rgb(red: 16, green: 120, blue: 149, alpha: 1), for: .normal)
        btn.addTarget(self, action: #selector(signup), for: .touchUpInside)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        return btn
    }()
    
    let signupLabel : UILabel = {
        let label = UILabel()
        label.text = "doesnt have an account?"
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
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.plain, target:nil, action:nil)

    }
    
    @objc func loginEmail() {
        navigationController?.pushViewController(LoginField(), animated: true)
    }
    
    @objc func signup() {
        navigationController?.pushViewController(SignupPage(), animated: true)
    }
    
    fileprivate var currentNonce: String?
    
    @objc func tapAppleButton() {
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()
        request.requestedScopes = [.fullName, .email]

        // Generate nonce for validation after authentication successful
        self.currentNonce = randomNonceString()
        // Set the SHA256 hashed nonce to ASAuthorizationAppleIDRequest
        request.nonce = sha256(currentNonce!)

        // Present Apple authorization form
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.presentationContextProvider = self
        authorizationController.performRequests()
    }
    
    private func randomNonceString(length: Int = 32) -> String {
        precondition(length > 0)
        let charset: Array<Character> =
            Array("0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._")
        var result = ""
        var remainingLength = length
        
        while remainingLength > 0 {
            let randoms: [UInt8] = (0 ..< 16).map { _ in
                var random: UInt8 = 0
                let errorCode = SecRandomCopyBytes(kSecRandomDefault, 1, &random)
                if errorCode != errSecSuccess {
                    fatalError("Unable to generate nonce. SecRandomCopyBytes failed with OSStatus \(errorCode)")
                }
                return random
            }
            
            randoms.forEach { random in
                if remainingLength == 0 {
                    return
                }
                
                if random < charset.count {
                    result.append(charset[Int(random)])
                    remainingLength -= 1
                }
            }
        }
        
        return result
    }

    private func sha256(_ input: String) -> String {
        let inputData = Data(input.utf8)
        let hashedData = SHA256.hash(data: inputData)
        let hashString = hashedData.compactMap {
            return String(format: "%02x", $0)
        }.joined()
        
        return hashString
    }
    
 
    func setupLayout() {
        
        view.addSubview(ImageView)
        ImageView.anchor(top: view.topAnchor, bottom: view.bottomAnchor, leading: nil, trailing: view.trailingAnchor, marginTop: 148, marginBottom: -365, marginLeading: 0, marginTrailing: -20, width: 0, height: 0, centerX: nil, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
        
        view.addSubview(pageTitle)
        pageTitle.anchor(top: ImageView.bottomAnchor, bottom: view.bottomAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor, marginTop: 0, marginBottom: -315, marginLeading: 90, marginTrailing: -90, width: 0, height: 0, centerX: view.centerXAnchor, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)

        view.addSubview(loginAppleButton)
        loginAppleButton.anchor(top: pageTitle.bottomAnchor, bottom: view.bottomAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor, marginTop: 72, marginBottom: -199, marginLeading: 57, marginTrailing: -57, width: 0, height: 0, centerX: view.centerXAnchor, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
        
        view.addSubview(loginEmailButton)
        loginEmailButton.anchor(top: loginAppleButton.bottomAnchor, bottom: view.bottomAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor, marginTop: 13, marginBottom: -142, marginLeading: 57, marginTrailing: -57, width: 0, height: 0, centerX: nil, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
        
        view.addSubview(signupLabel)
        signupLabel.anchor(top: loginEmailButton.bottomAnchor, bottom: nil, leading: nil, trailing: nil, marginTop: 71, marginBottom: 0, marginLeading: 0, marginTrailing: 0, width: 0, height: 0, centerX: view.centerXAnchor, centerY: nil, marginFromCenterX: -40, marginFromCenterY: 0)
        
        view.addSubview(signupButton)
        signupButton.anchor(top: signupLabel.topAnchor, bottom: nil, leading: signupLabel.trailingAnchor, trailing: nil, marginTop: 0, marginBottom: 0, marginLeading: 8, marginTrailing: 0, width: 0, height: 12, centerX: nil, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
    }
    

}

extension LoginScreen : ASAuthorizationControllerDelegate {

    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {

        if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
            
            UserDefaults.standard.set(appleIDCredential.user, forKey: "appleAuthorizedUserIdKey")
            // Do something with the credential...
            guard let nonce = currentNonce else {
              fatalError("Invalid state: A login callback was received, but no login request was sent.")
            }
            guard let appleIDToken = appleIDCredential.identityToken else {
              print("Unable to fetch identity token")
              return
            }
            guard let idTokenString = String(data: appleIDToken, encoding: .utf8) else {
              print("Unable to serialize token string from data: \(appleIDToken.debugDescription)")
              return
            }
            // Initialize a Firebase credential.
            let firebaseCredential = OAuthProvider.credential(withProviderID: "apple.com",
            idToken: idTokenString,
            rawNonce: nonce)
            // Sign in with Firebase.
            
            Auth.auth().signIn(with: firebaseCredential) { (authResult, error) in
                // Do something after Firebase sign in completed
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                
                // Mak a request to set user's display name on Firebase
                let changeRequest = authResult?.user.createProfileChangeRequest()
                changeRequest?.displayName = appleIDCredential.fullName?.givenName
                changeRequest?.commitChanges(completion: { (error) in

                    if let error = error {
                        print(error.localizedDescription)
                    } else {
                        print("Updated display name: \(Auth.auth().currentUser!.displayName!)")
                        let navController: UINavigationController = UINavigationController()
                        navController.viewControllers = [MainTabBarController()]
                        UIApplication.shared.windows.first?.rootViewController = navController
                    }
                })
            }
            

            // Save authorised user ID for future reference
            UserDefaults.standard.set(appleIDCredential.user, forKey: "appleAuthorizedUserIdKey")
        }
    }
    
    
    
    
    
    
}

extension LoginScreen : ASAuthorizationControllerPresentationContextProviding {
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return view.window!
    }
}
