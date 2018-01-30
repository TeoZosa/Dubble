//
//  BreakFaceViewController.swift
//  PrehabGUI
//
//  Created by Teofilo Zosa on 9/16/17.
//  Copyright © 2017 Teofilo Zosa. All rights reserved.
//

import UIKit

class BreakFaceViewController: UIViewController, DRDoubleDelegate {
    var spinDone = false
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(8), execute: {
//            // Put your code which should be executed with a delay here
//            Global.Variables.sharedDouble.turn(byDegrees: 360*99999999)
//            //            sleep(10)
//
//
//        })
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if !spinDone{
            spinDone = true
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: {
            // Put your code which should be executed with a delay here
            Global.Variables.sharedDouble.turn(byDegrees: 180)
//            sleep(10)

            
        })
//
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(5), execute: {
               Global.Variables.sharedDouble.deployKickstands()
            })
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(5), execute: {
                // Put your code which should be executed with a delay here
                let alertController = UIAlertController(title: "Phew!", message: "Thanks, I really needed that. Now let's get back to your work out!", preferredStyle: .alert)
                
                let OKAction = UIAlertAction(title: "Let's do it!", style: .default) { (action:UIAlertAction!) in
                    print("you have pressed Ready button");
                    //Call another alert here
                    self.performSegue(withIdentifier: "ActivitySelectionScreen", sender: self)
                }
                alertController.addAction(OKAction)
                
                self.present(alertController, animated: true, completion:nil)
                
            })
            
        }
 

        // Do any additional setup after loading the view.
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


