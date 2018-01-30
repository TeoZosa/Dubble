///Users/teofilozosa/Developer/PrehabGUI/PrehabGUI/InstructionsViewController.swift
//  InstructionsViewController.swift
//  PrehabGUI
//
//  Created by Teofilo Zosa on 9/12/17.
//  Copyright © 2017 Teofilo Zosa. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class InstructionsViewController: UIViewController {
    
    var player: AVPlayer?
    var controller: AVPlayerViewController?
//    var layer: AVPlayerLayer?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        var displayedVariation: String
        if variation == "Not Standing"{
            displayedVariation = Global.Variables.getLyingOrSitting(activity: Global.Variables.currentBodyPart!)
        } else {
            displayedVariation = variation
        }
        ActivityTextLabel.text = displayedVariation + " " +  Global.Variables.currentBodyPart! + " Instructions"
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        DispatchQueue.main.async {
            self.player?.pause()
            self.player?.replaceCurrentItem(with: nil)
            self.player = nil
        
            self.controller?.removeFromParentViewController()
            self.controller = nil
//            self.layer?.removeFromSuperlayer()
//            self.layer = nil
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        playVideo()
    }
    @IBOutlet weak var ActivityTextLabel: UILabel!
    @IBAction func goBack(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
    }
    let bodyPart = Global.Variables.currentBodyPart!
    let variation = Global.Variables.currentVariation!
    
    private func playVideo() {
        print(bodyPart)
        print(variation)
        guard let path = Bundle.main.path(forResource: bodyPart+variation+"Instructional", ofType:"mp4") else {
            debugPrint("VIDEO not found")
            return
        }
//        var urlPath = "https://app.box.com/s/25ta4a2i6mz6kt6ea4rxxpt29k68lido"
//        var urlLink = URL(string:urlPath)!
//        let player = AVPlayer(url: urlLink)
        
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
        let videoFrame = CGRect(x: screenSize.width*0.015, y: screenSize.height*0.3, width: screenSize.width*0.97, height: ((screenSize.height - 10) * 0.5))
        controller?.view.frame = videoFrame
        self.view.addSubview((controller?.view)!)
//        controller.showsPlaybackControls = false
//        controller.view.isUserInteractionEnabled = false

        player?.play()
        
        NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: player?.currentItem, queue: nil, using: { (_) in
            DispatchQueue.main.async {
                self.player?.seek(to: kCMTimeZero)
                self.player?.play()
            }
        })
        
        //let player = AVPlayer(url: URL(fileURLWithPath: path))
//        let playerController = AVPlayerViewController()
//        playerController.player = player
//        present(controller, animated: true) {
//            player.play()
//        }
    }
}
