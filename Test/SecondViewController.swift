//
//  SecondViewController.swift
//  Test
//
//  Created by nora  mofeed on 3/21/21.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var codeLabel: UILabel!
    
    
    @IBOutlet weak var btn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
        
    }
    
    
    
    @IBAction func generateBtn(_ sender: Any) {
        
        let randomNumber = Int.random(in: 0...10000)
        codeLabel.text = "\(randomNumber)"
        
        btn.isHidden = true
        
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
