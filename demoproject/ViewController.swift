//
//  ViewController.swift
//  demoproject
//
//  Created by Admin on 10/05/22.
//

import UIKit
import FBSDKLoginKit

class ViewController: UIViewController {

//    @IBOutlet weak var FBButton: FBLoginButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        attack(with: Knife())
        attack(with: Grenade())
        attack(with: Gun())
//        let loginButton = FBLoginButton()
//             loginButton.center = view.center
////             view.addSubview(loginButton)
//        if let token = AccessToken.current,
//            !token.isExpired {
//            // User is logged in, do work such as go to next view controller.
//        }else{
//            FBButton.permissions = ["public_profile", "email"]
//            FBButton.delegate = self
//
//        }
    }
    struct Knife {
    }
    struct Grenade {
    }
    struct Gun {
    }
    func attack(with weapon:Knife) {
        print("Attacking with Knife")
    }
    func attack(with weapon:Grenade) {
        print("Attacking with Grenade")
    }
    func attack(with weapon:Gun) {
        print("Attacking with Gun")
    }
      
 
    
    @IBAction func fB_click(_ sender: Any) {
        let loader = loader()
        DispatchQueue.global(qos: .background).async { [self] in
            print("Done")
            DispatchQueue.main.async { [self] in
                stopLoader(loader: loader)
            }
            
        }

        
    }
    func loader() -> UIAlertController {
            let alert = UIAlertController(title: nil, message: "Please wait...", preferredStyle: .alert)
            let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
            loadingIndicator.hidesWhenStopped = true
            loadingIndicator.style = UIActivityIndicatorView.Style.large
            loadingIndicator.startAnimating()
            alert.view.addSubview(loadingIndicator)
            present(alert, animated: true, completion: nil)
            return alert
        }
        
        func stopLoader(loader : UIAlertController) {
            DispatchQueue.main.async {
                loader.dismiss(animated: true, completion: nil)
            }
        }

//    override func viewDidAppear(_ animated: Bool) {
//          let loader =   self.loader()
//          DispatchQueue.main.asyncAfter(deadline: .now() + 25) {
//              self.stopLoader(loader: loader)
//          }
//      }


     



}
extension ViewController:LoginButtonDelegate{
    func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
        let token = result?.token?.tokenString
        let request = FBSDKLoginKit.GraphRequest(graphPath: "me", parameters: ["fields" :"email,name"], tokenString: token, version: nil, httpMethod: .get)
        request.start { connection, result, error in
            if result != nil{
            print("\(result)")
            }else{
                print("error:\(error)")
            }
        }
    }
    
    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
        print("logOut")
    }
    
    
}

