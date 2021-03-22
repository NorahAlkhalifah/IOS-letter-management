//
//  ViewController.swift
//  Test
//
//  Created by nora  mofeed on 3/21/21.
//

import UIKit
import GoogleSignIn


class ViewController: UIViewController , GIDSignInDelegate {
    
    
    @IBOutlet var signInButton: GIDSignInButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        GIDSignIn.sharedInstance().delegate = self

        
        view.addSubview(signInButton)
        
        if GIDSignIn.sharedInstance()?.currentUser != nil{

            // signed in
        }
        else{

        }
        
        GIDSignIn.sharedInstance()?.presentingViewController = self
        
        
        }
    
    
   
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        
        self.present(vc, animated: true, completion: nil)
      
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

