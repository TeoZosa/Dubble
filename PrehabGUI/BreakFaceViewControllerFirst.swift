//
//  BreakFaceViewControllerFirst.swift
//  PrehabGUI
//
//  Created by Teofilo Zosa on 9/19/17.
//  Copyright © 2017 Teofilo Zosa. All rights reserved.
//

import UIKit

class BreakFaceViewControllerFirst: UIViewController, DRDoubleDelegate {
        var spinDone = false
    
        
        override func viewDidLoad() {
            super.viewDidLoad()
            if !spinDone {
                spinDone = true
                Global.Variables.sharedDouble.retractKickstands()
                DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(8), execute: {
                    // Put your code which should be executed with a delay here
                    Global.Variables.sharedDouble.turn(byDegrees: 180)
                    //            sleep(10)
                    
                    
                })
                
                DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(10), execute: {
                    // Put your code which should be executed with a delay here
                   
                        self.performSegue(withIdentifier: "BreakFaceViewControllerSecond", sender: self)
                    
                    
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



