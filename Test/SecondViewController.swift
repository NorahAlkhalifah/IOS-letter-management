//
//  SecondViewController.swift
//  Test
//
//  Created by nora  mofeed on 3/21/21.
//

import UIKit
import LocalAuthentication
import FirebaseDatabase
import FirebaseStorage
import Firebase
import FirebaseFirestore

class SecondViewController: UIViewController {
        
    @IBOutlet weak var codeLabel: UILabel!
    
    @IBOutlet weak var btn: UIButton!
    
    let db = Firestore.firestore()

    var ref: DocumentReference? = nil
    var uid = ""
    var number = 0
    var stringNumber : String!
    var date = FirebaseFirestore.Timestamp()

    
    override func viewDidLoad() {
        let user = Auth.auth().currentUser
        if let user = user {
          // The user's ID, unique to the Firebase project.
          // Do NOT use this value to authenticate with your backend server,
          // if you have one. Use getTokenWithCompletion:completion: instead.
         uid = user.uid
        }

        super.viewDidLoad()
    
    }
    
    @IBAction func didTapButton (sender: Any){
        let context = LAContext()
        
        var error: NSError? = nil
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error){
            
            let reason = "please authorize with bio ID!"
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) {[weak self] success,error in
                

                DispatchQueue.main.async { [self] in
                    guard success, error == nil else{
                    
                    // failed
                        let alert = UIAlertController(title: "Failed to authenticate",
                                                      message: "Please try again",
                                                      preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "dismiss", style: .cancel, handler: nil))
                        
                        self?.present(alert, animated: true)
                    return
                }
                    
                    self?.number = Int.random(in: 1000...9999)
                    
                    print(self?.number)
                   
                    self?.codeLabel.text = String(self!.number)
                    
                    self!.btn.isHidden = true
                    
                    self!.codeLabel.textColor = UIColor.white
                    
                    print(self!.stringNumber )
                    
                }
                
                
                
                
                self?.ref = self?.db.collection("Authentications").addDocument(data: ["userID":self?.uid,"code":String(self!.number),"date":self?.date])
                
                
                { err in
                    if let err = err {
                        print("Error adding document: \(err)")
                    }
                    else {
                        print("Document added with ID: \(self?.ref!.documentID)")
                    }
                }
            }
        }
        else{
            let alert = UIAlertController(title: "Unavailable",
                                          message: "You cant use this feature",
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "dismiss", style: .cancel, handler: nil))
            
            present(alert, animated: true)
        }
    }
    


    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    


}
