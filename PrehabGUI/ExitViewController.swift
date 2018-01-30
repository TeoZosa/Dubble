//
//  ExitViewController.swift
//  PrehabGUI
//
//  Created by Teofilo Zosa on 9/14/17.
//  Copyright © 2017 Teofilo Zosa. All rights reserved.
//

import UIKit

class ExitViewController: UIViewController, DRDoubleDelegate {
    
    //Todo: what sort of happy dance? (
//    let Global.Variables.sharedDouble = DRDouble()
    override func viewDidLoad() {
        super.viewDidLoad()
        Global.Variables.sharedDouble.delegate = self //as! DRDoubleDelegate
//        doubleDriveShouldUpdate(Global.Variables.sharedDouble)
        // Do any additional setup after loading the view.
    }

  
  
//    func doubleDriveShouldUpdate(_ theDouble: DRDouble!) {
////        let driveDir = ForwardButton.isHighlighted ? DRDriveDirection.forward : (BackwardButton.isHighlighted ? DRDriveDirection.backward : DRDriveDirection.stop)
//          let driveDir = ForwardButton.isHighlighted ? DRDriveDirection.forward : (BackwardButton.isHighlighted ? DRDriveDirection.backward : DRDriveDirection.stop)
//        theDouble.drive(driveDir, turn: 0)
//

    @IBAction func EndSession(_ sender: UIButton) {
        Global.Variables.sharedDouble.poleDown()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let actualDuration = Global.Variables.seconds//since we are counting up now
        for dataPoint in Global.Variables.activityLog {//write out data to log in batch
            log.info("@$\(dataPoint.User),\(dataPoint.Session),\(dataPoint.Advice),\(dataPoint.Activity),\(String(dataPoint.ActivityDuration)),\(String(actualDuration))#~")
        }
         log.info("\n--End User Session--\n\n--New User Session--")
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
