//
//  IntroFaceViewController.swift
//  PrehabGUI
//
//  Created by Teofilo Zosa on 9/19/17.
//  Copyright © 2017 Teofilo Zosa. All rights reserved.
//

import UIKit

class IntroFaceViewController: UIViewController, DRDoubleDelegate {
//    let sharedDouble = DRDouble()
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        Global.Variables.sharedDouble.delegate = self

        
      //  Global.Variables.sharedDouble.didconnect

        // Do any additional setup after loading the view.
    }
    @IBAction func StartSession(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Oh, Hi!", message: "I was just resting my eyes, I swear. Give me a second to raise my display up so I can see you.", preferredStyle: .alert)
        
        let yesBreak = UIAlertAction(title: "Sure!", style: .default) { (action:UIAlertAction!) in
            print("Break: Yes");
            //Call another alert here
            //Break screen
            
            self.performSegue(withIdentifier: "WakeUp", sender: self)
            Global.Variables.sharedDouble.poleUp()
            
        }
        
        alertController.addAction(yesBreak)
        
        self.present(alertController, animated: true, completion:nil)
        
       // Global.Variables.sharedDouble.poleUp()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
