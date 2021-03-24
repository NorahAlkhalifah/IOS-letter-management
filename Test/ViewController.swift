//
//  ViewController.swift
//  Test
//
//  Created by nora  mofeed on 3/21/21.
//

import UIKit
import GoogleSignIn
import Firebase
import FirebaseAuth



class ViewController: UIViewController , GIDSignInDelegate {
    
    
    @IBOutlet var signInButton: GIDSignInButton!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        GIDSignIn.sharedInstance().delegate = self

        
        GIDSignIn.sharedInstance()?.presentingViewController = self
        
        
        GIDSignIn.sharedInstance()?.restorePreviousSignIn()
        
       //  view.addSubview(signInButton)
        
        }
    
    
   
//    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
//
//        if let err = error {
//                 print("Error signing in: ", err)
//                 return
//             }
//
//        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
//
//            self.present(vc, animated: true, completion: nil)
//
//
//    }
    
    func sign(_ signIn: GIDSignIn!,
              didSignInFor user: GIDGoogleUser!,
              withError error: Error!) {
        
        // Check for sign in error
        if let error = error {
            if (error as NSError).code == GIDSignInErrorCode.hasNoAuthInKeychain.rawValue {
                print("The user has not signed in before or they have since signed out.")
            } else {
                print("\(error.localizedDescription)")
            }
            return
        }
        
        // Get credential object using Google ID token and Google access token
        guard let authentication = user.authentication else {
            return
        }
        let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,
                                                       accessToken: authentication.accessToken)
        
        // Authenticate with Firebase using the credential object
        Auth.auth().signIn(with: credential) { (authResult, error) in
            if let error = error {
                print("Error occurs when authenticate with Firebase: \(error.localizedDescription)")
            }
                    let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
            
                        self.present(vc, animated: true, completion: nil)
                
            // Post notification after user successfully sign in

        }

    }

    
 
 
//    override func prepare(for segue: UIStoryboardSegue, sender: (Any)?)
//    {
//        if (segue.identifier == "page2")
//        {
//
//            let secondView = segue.destination as! SecondViewController
//
//            let data = sender as! NSURL
//
//            // secondView.generateBtn = data
//
//
//        }
//
//
//    }

}

