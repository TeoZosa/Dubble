//
//  ActivityViewController.swift
//  PrehabGUI
//
//  Created by Teofilo Zosa on 9/12/17.
//  Copyright © 2017 Teofilo Zosa. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation
import XCGLogger


class ActivityViewController: UIViewController {
    let bodyPart = Global.Variables.currentBodyPart!
    let variation = Global.Variables.currentVariation!
    var player: AVPlayer?
    var controller: AVPlayerViewController?
    func getTodayString() -> String{
        
        let date = Date()
        let calender = Calendar.current
        let components = calender.dateComponents([.year,.month,.day,.hour,.minute,.second], from: date)
        
//        let year = components.year
        let month = components.month
        let day = components.day
        let hour = components.hour
        let minute = components.minute
        let second = components.second
        
        let today_string = String(month!) + "-" + String(day!) + " " + String(hour!)  + ":" + String(minute!) + ":" +  String(second!)
        
        return today_string
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        var displayedVariation: String
        if variation == "Not Standing"{
            displayedVariation = Global.Variables.getLyingOrSitting(activity: Global.Variables.currentBodyPart!)
        } else {
            displayedVariation = variation
        }
        
        ActivityName.text =  displayedVariation  + " " + Global.Variables.currentBodyPart! + ", go!"
        runTimer()
        
    
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        playVideo()
        if Global.Variables.newActivity == true{
            Global.Variables.lastClockTime = Global.Variables.seconds
            Global.Variables.newActivity = false
            
        }

    }

    override func viewWillDisappear(_ animated: Bool){
        super.viewWillDisappear(animated)
        Global.Variables.timer?.invalidate()
        Global.Variables.timer = nil
        DispatchQueue.main.async {
            self.player?.pause()
            self.player = nil
            self.player?.replaceCurrentItem(with: nil)
            self.controller?.removeFromParentViewController()
            self.controller = nil
            //            self.layer?.removeFromSuperlayer()
            //            self.layer = nil
        }
    }

    @IBOutlet var ActivityName: UILabel!
   // @IBOutlet var TimerLabel: UILabel!
  
    @IBAction func goBack(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
    }

    
    @IBAction func activityCompleted(_ sender: UIButton) {
        //log entire activity block once user clicks done (since they might be going back and forth to instructions)
        //Note: should only count the cumulative time on the activity screen, NOT time at the instruction scren
        //todo: invalidate the timer here so that it can keep clicking?
        Global.Variables.newActivity = true
        let time = Global.Variables.seconds - Global.Variables.lastClockTime!
        let key = Array(Global.Variables.sessionAdvice.keys)[0] // only one piece of advice => only one key
        //append to log array
        Global.Variables.activityLog.append((getTodayString(), Global.Variables.user!, key, "\(bodyPart)_\(Global.Variables.currentVariation!.trimmingCharacters(in: .whitespacesAndNewlines))", time, 0))
        Global.Variables.sharedDouble.poleUp()//put the pole back up when going to the main activity screen

    }
    func updateTimer() {
        Global.Variables.seconds += 1     //This will decrement(count down)the seconds.

    }
    
    func runTimer() {
         Global.Variables.timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(ActivityViewController.updateTimer)), userInfo: nil, repeats: true)
//        if Global.Variables.timer == nil{//run timer only if no other timer exists
//        Global.Variables.timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(ActivityViewController.updateTimer)), userInfo: nil, repeats: true)
//        }
    }
    
  
    private func playVideo() {
        guard let path = Bundle.main.path(forResource: bodyPart+variation+"Activity", ofType:"mp4") else {
            debugPrint("VIDEO not found")
            return
        }
      
        if player == nil {
        player = AVPlayer(url: URL(fileURLWithPath: path))
        }
        else{
            player?.replaceCurrentItem(with: AVPlayerItem(url: URL(fileURLWithPath: path)))
        }
        
        controller = AVPlayerViewController()
        controller?.player = player
        player?.isMuted = true
        
        self.addChildViewController(controller!)
        let screenSize = UIScreen.main.bounds.size
//        let videoFrame = CGRect(x: screenSize.width*0.25, y: screenSize.height*0.4, width: screenSize.width*0.5, height: ((screenSize.height - 10) * 0.5)*0.5)//small centered
        let videoFrame = CGRect(x: screenSize.width*0.015, y: screenSize.height*0.3, width: screenSize.width*0.97, height: ((screenSize.height - 10) * 0.5))//large centered
        controller?.view.frame = videoFrame
        self.view.addSubview((controller?.view)!)
        controller?.showsPlaybackControls = false
        controller?.view.isUserInteractionEnabled = false
        
        player?.play()
        
        NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: player?.currentItem, queue: nil, using: { (_) in
            DispatchQueue.main.async {
                self.player?.seek(to: kCMTimeZero)
                self.player?.play()
            }
        })
}
}
