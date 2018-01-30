//
//  MainActivityViewController.swift
//  PrehabGUI
//
//  Created by Teofilo Zosa on 9/8/17.
//  Copyright © 2017 Teofilo Zosa. All rights reserved.
//

import UIKit

class MainActivityViewController: UIViewController {
    
    
 
    
 //   @IBOutlet var TimerLabel: UILabel!
    
    
    @IBOutlet var one: UIButton!
    @IBOutlet var two: UIButton!
    @IBOutlet var three: UIButton!
    @IBOutlet var four: UIButton!
    @IBOutlet var five: UIButton!
    @IBOutlet var six: UIButton!
    @IBOutlet var seven: UIButton!
    @IBOutlet var eight: UIButton!
    
    let btnOneImage = UIImage(named: Global.Variables.activityArray[0])
    let btnTwoImage = UIImage(named: Global.Variables.activityArray[1])
    let btnThreeImage = UIImage(named: Global.Variables.activityArray[2])
    let btnFourImage = UIImage(named: Global.Variables.activityArray[3])
    let btnFiveImage = UIImage(named: Global.Variables.activityArray[4])
    let btnSixImage = UIImage(named: Global.Variables.activityArray[5])
    let btnSevenImage = UIImage(named: Global.Variables.activityArray[6])
    let btnEightImage = UIImage(named: Global.Variables.activityArray[7])
    
    @IBAction func ActivitySelected(_ sender: UIButton) {
//        Global.Variables.currentBodyPart = Global.Variables.activityArray[Int(sender.currentTitle!)!]
          Global.Variables.currentBodyPart = sender.currentTitle!
    }
    
 
    
  
    
        
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        Global.Variables.activityArray = Global.Variables.activityArray.shuffled()
        if Global.Variables.seconds >= Global.Variables.timeLimitInSeconds{
            
            let alertController = UIAlertController(title: "Wow, Time's Up!", message: "Congratulations, you went for the whole session!", preferredStyle: .alert)
            
            let OKAction = UIAlertAction(title: "Dismiss", style: .default) { (action:UIAlertAction!) in
                print("you have pressed Yes button");
                //Call another alert here
                self.performSegue(withIdentifier: "ExitScreen", sender: self)
            }
            alertController.addAction(OKAction)
            
            self.present(alertController, animated: true, completion:nil)
        }
        else if false || (Global.Variables.seconds >= Global.Variables.timeLimitInSeconds/2 &&//set false to true for debug mode
            Global.Variables.seconds < Global.Variables.timeLimitInSeconds &&
            !Global.Variables.breakPassed){
            Global.Variables.breakPassed = true
            
            let alertController = UIAlertController(title: "You're Doing Great!", message: "Wow, look at you! You're making me want to stretch too! Is it okay if I move around a bit?", preferredStyle: .alert)
            
            let yesBreak = UIAlertAction(title: "Sure!", style: .default) { (action:UIAlertAction!) in
                print("Break: Yes");
                //Call another alert here
                //Break screen
                
                self.performSegue(withIdentifier: "Break", sender: self)
                
            }

            alertController.addAction(yesBreak)
            
            self.present(alertController, animated: true, completion:nil)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        one.setImage(btnOneImage , for: .normal)
//        one.setTitleColor(UIColor.black, for: .normal)
        one.imageEdgeInsets = UIEdgeInsets(top: 0,left: 0,bottom: 0,right: 0)
        one.titleEdgeInsets = UIEdgeInsets(top: 0,left: -150,bottom: -140,right: 0)
        one.setTitle(Global.Variables.activityArray[0], for: .normal)
        
        two.setImage(btnTwoImage , for: .normal)
//        two.setTitleColor(UIColor.black, for: .normal)
        two.imageEdgeInsets = UIEdgeInsets(top: 0,left: 0,bottom: 0,right: 0)
        two.titleEdgeInsets = UIEdgeInsets(top: 0,left: -150,bottom: -140,right: 0)
        two.setTitle(Global.Variables.activityArray[1], for: .normal)
        
        three.setImage(btnThreeImage , for: .normal)
//        three.setTitleColor(UIColor.black, for: .normal)
        three.imageEdgeInsets = UIEdgeInsets(top: 0,left: 0,bottom: 0,right: 0)
        three.titleEdgeInsets = UIEdgeInsets(top: 0,left: -150,bottom: -140,right: 0)
        three.setTitle(Global.Variables.activityArray[2], for: .normal)
        
        four.setImage(btnFourImage , for: .normal)
//        four.setTitleColor(UIColor.black, for: .normal)
        four.imageEdgeInsets = UIEdgeInsets(top: 0,left: 0,bottom: 0,right: 0)
        four.titleEdgeInsets = UIEdgeInsets(top: 0,left: -150,bottom: -140,right: 0)
        four.setTitle(Global.Variables.activityArray[3], for: .normal)
        
        five.setImage(btnFiveImage , for: .normal)
//        five.setTitleColor(UIColor.black, for: .normal)
        five.imageEdgeInsets = UIEdgeInsets(top: 0,left: 0,bottom: 0,right: 0)
        five.titleEdgeInsets = UIEdgeInsets(top: 0,left: -150,bottom: -140,right: 0)
        five.setTitle(Global.Variables.activityArray[4], for: .normal)
        
        six.setImage(btnSixImage , for: .normal)
//        six.setTitleColor(UIColor.black, for: .normal)
        six.imageEdgeInsets = UIEdgeInsets(top: 0,left: 0,bottom: 0,right: 0)
        six.titleEdgeInsets = UIEdgeInsets(top: 0,left: -150,bottom: -140,right: 0)
        six.setTitle(Global.Variables.activityArray[5], for: .normal)
        
        seven.setImage(btnSevenImage , for: .normal)
//        seven.setTitleColor(UIColor.black, for: .normal)
        seven.imageEdgeInsets = UIEdgeInsets(top: 0,left: 0,bottom: 0,right: 0)
        seven.titleEdgeInsets = UIEdgeInsets(top: 0,left: -150,bottom: -140,right: 0)
        seven.setTitle(Global.Variables.activityArray[6], for: .normal)
        
        eight.setImage(btnEightImage , for: .normal)
//        eight.setTitleColor(UIColor.black, for: .normal)
        eight.imageEdgeInsets = UIEdgeInsets(top: 0,left: 0,bottom: 0,right: 0)
        eight.titleEdgeInsets = UIEdgeInsets(top: 0,left: -150,bottom: -140,right: 0)
        eight.setTitle(Global.Variables.activityArray[7], for: .normal)
   //     TimerLabel.text = Global.Variables.clockTimeAsString()


        // Do any additional setup after loading the view.
    }

    @IBAction func Stop(_ sender: UIButton) {
        let alertController = UIAlertController(title: "End Session", message: "Would you like to end your session?", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "No", style: .cancel) { (action:UIAlertAction!) in
            print("you have pressed the No button");
            //Call another alert here
        }
        alertController.addAction(cancelAction)
        
        let OKAction = UIAlertAction(title: "Yes", style: .default) { (action:UIAlertAction!) in
            print("you have pressed Yes button");
            //Call another alert here
            
            
            
            self.performSegue(withIdentifier: "ExitScreen", sender: self)
           
        }
        alertController.addAction(OKAction)
        
        self.present(alertController, animated: true, completion:nil)
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
