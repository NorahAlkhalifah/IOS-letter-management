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

class SecondViewController: UIViewController {
    
    @IBOutlet weak var codeLabel: UILabel!
    
    @IBOutlet weak var btn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
//        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
//        view.addSubview(button)
//        button.center = view.center
//        button.setTitle("Authenticate to generate the 4 digit code", for: .normal)
//        button.backgroundColor = .systemTeal
//        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
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
                    // // // // success // // // //
//                    let vc2 = UIViewController()
//                    vc2.title = "Welcome"
//                    vc2.view.backgroundColor = .systemTeal
//                    self?.present(UINavigationController(rootViewController: vc2),
//                                  animated: true,
//                                  completion: nil)
                    
                    let number = Int.random(in: 0...10000)
                  
                    self?.codeLabel.text = "\(number)"
                    
                    self!.btn.isHidden = true
                
                    
                    //view.addSubview(label)
                    //self?.view = view
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
