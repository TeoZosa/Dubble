//
//  ExerciseVersionViewController.swift
//  PrehabGUI
//
//  Created by Teofilo Zosa on 9/8/17.
//  Copyright © 2017 Teofilo Zosa. All rights reserved.
//

import UIKit

class ExerciseVersionViewController: UIViewController {
   
    
   // @IBOutlet var TimerLabel: UILabel!
    
    
    @IBOutlet var sitting: UIButton!
   
    @IBOutlet var standing: UIButton!
    @IBAction func goBack(_ sender: UIButton) {
       
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func NotStanding(_ sender: UIButton) {
        Global.Variables.sharedDouble.poleDown()
    }
    @IBAction func VersionSelected(_ sender: UIButton) {
        Global.Variables.currentVariation = sender.currentTitle!
        print(Global.Variables.currentVariation!)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        TimerLabel.text = Global.Variables.clockTimeAsString()//"\(Int(Global.Variables.seconds/60)):\(String(format: "%02d", Global.Variables.seconds%60))" //This will update the label.

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
