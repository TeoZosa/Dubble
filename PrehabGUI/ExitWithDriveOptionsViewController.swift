//
//  ExitWithDriveOptionsController.swift
//  PrehabGUI
//
//  Created by Teofilo Zosa on 9/14/17.
//  Copyright © 2017 Teofilo Zosa. All rights reserved.
//

import UIKit

class ExitWithDriveOptionsViewController: UIViewController, DRDoubleDelegate {
    
    //Todo: what sort of happy dance? (
    let sharedDouble = DRDouble()
    override func viewDidLoad() {
        super.viewDidLoad()
        sharedDouble.delegate = self //as! DRDoubleDelegate
        doubleDriveShouldUpdate(sharedDouble)
        //        sharedDouble.retractKickstands()
        //        var count = 0
        //        while  count < 100{
        //            sharedDouble.drive(DRDriveDirection.forward, turn: 0)
        //            count += 1
        
        
        // }
        //        sharedDouble.turn(byDegrees: 90)
        //  let forward: DRDriveDirection = 1 as DRDriveDirection
        // sharedDouble.deployKickstands()
        
        
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBOutlet var BackwardButton: UIButton!
    @IBOutlet var ForwardButton: UIButton!
    
    func doubleDriveShouldUpdate(_ theDouble: DRDouble!) {
        //        let driveDir = ForwardButton.isHighlighted ? DRDriveDirection.forward : (BackwardButton.isHighlighted ? DRDriveDirection.backward : DRDriveDirection.stop)
        let driveDir = ForwardButton.isHighlighted ? DRDriveDirection.forward : (BackwardButton.isHighlighted ? DRDriveDirection.backward : DRDriveDirection.stop)
        theDouble.drive(driveDir, turn: 0)
        //        let drive: Float = (ForwardButton.isHighlighted ? 1.0 : (BackwardButton.isHighlighted ? -1.0 : 0.0))
        //        theDouble.variableDrive(drive, turn: 0)
    }
    //    - (void)doubleDriveShouldUpdate:(DRDouble *)theDouble {
    //    float drive = (driveForwardButton.highlighted) ? kDRDriveDirectionForward : ((driveBackwardButton.highlighted) ? kDRDriveDirectionBackward : kDRDriveDirectionStop);
    //    float turn = (driveRightButton.highlighted) ? 1.0 : ((driveLeftButton.highlighted) ? -1.0 : 0.0);
    //    [theDouble drive:drive turn:turn];
    //    }
    
    //    func forward(){
    //        sharedDouble.variableDrive(1 as Float, turn: 0 as Float)
    //    }
    
    @IBAction func Retract(_ sender: UIButton) {
        sharedDouble.retractKickstands()
    }
    @IBAction func Deploy(_ sender: UIButton) {
        sharedDouble.deployKickstands()
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let actualDuration = Global.Variables.seconds//since we are counting up now
        for dataPoint in Global.Variables.activityLog {//write out data to log in batch
            log.info("@$\(dataPoint.User),\(dataPoint.Session),\(dataPoint.Advice),\(dataPoint.Activity),\(String(dataPoint.ActivityDuration)),\(String(actualDuration))#~")
        }
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

