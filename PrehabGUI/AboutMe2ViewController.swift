//
//  AboutMe2ViewController.swift
//  PrehabGUI
//
//  Created by Teofilo Zosa on 9/21/17.
//  Copyright © 2017 Teofilo Zosa. All rights reserved.
//

import UIKit

class AboutMe2ViewController: UIViewController {
    
    @IBOutlet var AboutMeText: UITextView!
    @IBAction func back(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.AboutMeText.text = "I also really really love my job, so sometimes I get so excited I want to join in for a double stretch! Get it, because my name is Double and there's two of us? I don't have ears so I can't hear you, but I'll assume you're laughing because that was a really good one.\n\nAnyway, jokes aside, I'll let you know whenever I'm ready to take a stretch break. Just remember to step back about a foot so I don't accidentally bump into you or anything. Sound good? Great! I have a feeling we're gonna have a lot of fun. \n\nLet's get started, shall we? "
        
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

