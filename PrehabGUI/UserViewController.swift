//
//  UserViewController.swift
//  PrehabGUI
//
//  Created by Teofilo Zosa on 9/7/17.
//  Copyright © 2017 Teofilo Zosa. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {
    
    //TODO: Raise head to greet?
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        print(Global.Variables.user)
        print("WELCOMESCREEN%%%%%%%%%%%%%%%%%%%%%%%1")
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        WelcomeLabel.text = "Welcome \(String(describing: Global.Variables.user!))!"
    }

    @IBAction func backToUserID(_ sender: UIButton) {
//        _ = navigationController?.popViewController(animated: true)
            dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var WelcomeLabel: UILabel!
    
    @IBAction func next(_ sender: UIButton) {
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

//     MARK: - Navigation
//
//     In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "Back To User Selection"{
//            ViewController = segue.destination as? ViewController
//            ViewController?.publicAPI = infoToCommunicateBack
//        }
//    }


}
