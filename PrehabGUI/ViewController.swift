//
//  ViewController.swift
//  PrehabGUI
//
//  Created by Teofilo Zosa on 9/5/17.
//  Copyright © 2017 Teofilo Zosa. All rights reserved.
//

import UIKit
//import FirebaseAnalytics

class ViewController: UIViewController {
    
    
    func getTodayString() -> String{
        
        let date = Date()
        let calender = Calendar.current
        let components = calender.dateComponents([.year,.month,.day,.hour,.minute,.second], from: date)
        
        let year = components.year
        let month = components.month
        let day = components.day
        let hour = components.hour
        let minute = components.minute
        let second = components.second
        
        let today_string = String(year!) + "-" + String(month!) + "-" + String(day!) + " " + String(hour!)  + ":" + String(minute!) + ":" +  String(second!)
        
        return today_string
        
    }
    
    @IBAction func IDTyped(_ sender: UITextField) {
        Global.Variables.user = sender.text!
        print(Global.Variables.user!)
        print(getTodayString())
        print("LOOOOOOOOOK HEEEEEEEERRREEEEE")

    }

    
    
    @IBAction func chooseUserID(_ sender: UIButton) {
        if Global.Variables.user != nil{
            if Global.Variables.user == "debug"{
                Global.Variables.seconds = max(Global.Variables.timeLimitInSeconds - 10, 0)//go to last 10 seconds of session, else time limit already <10 seconds 
            }
            self.performSegue(withIdentifier: "ValidUserID", sender: self)
        }
    
    }

   
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      //  let destinationViewController = segue.destination
//        if let userViewController = destinationViewController as? UserViewController{
//            if let identifier = segue.identifier{
//                userViewController.user = identifier
//            }
//        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Global.Variables.activityArray = Global.Variables.activityArray.shuffled() //reshuffle for new session
        
      
        Global.Variables.breakPassed = false
        Global.Variables.seconds = 0
        Global.Variables.activityLog = []
        // Do any additional setup after loading the view, typically from a nib.
       
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        let date = Date()
        let calender = Calendar.current
        let components = calender.dateComponents([.year,.month,.day,.hour,.minute,.second], from: date)
        let month = components.month
        let day = components.day
        
        if month! == 10 && (day! == 2 || day! == 3) && Global.Variables.user?.lowercased() != "ak" && Global.Variables.user?.lowercased() != "aa" {
            Global.Variables.sessionAdvice = Global.Variables.holdoutAdvice
            print("Holdout Advice: Back")
        }else{
            Global.Variables.sessionAdvice = Global.Variables.sessionAdviceArray.randomItem()!
            print("Random Advice")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

