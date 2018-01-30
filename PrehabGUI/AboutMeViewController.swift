//
//  AboutMeViewController.swift
//  PrehabGUI
//
//  Created by Teofilo Zosa on 9/21/17.
//  Copyright © 2017 Teofilo Zosa. All rights reserved.
//

import UIKit

class AboutMeViewController: UIViewController {

    @IBOutlet var AboutMeText: UITextView!
    @IBAction func back(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.AboutMeText.text = "My name is Double (Dubs for short) and I'm here to help you with your stretching routine!\n\nDuring our time together, I'll try my best to adapt to the activities you're doing. For instance, I'll lower my display during non-standing exercises, and raise it back up after. You can also tell me how low or high to go at any time via the \"Adjust Height\" button on the top right of your screen (feel free to test it out)."

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
