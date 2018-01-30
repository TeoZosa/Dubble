//
//  ExpertAdviceViewController.swift
//  PrehabGUI
//
//  Created by Teofilo Zosa on 9/8/17.
//  Copyright © 2017 Teofilo Zosa. All rights reserved.
//

import UIKit

class ExpertAdviceViewController: UIViewController {
    
    @IBAction func goBack(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
    }
    @IBAction func next(_ sender: UIButton) {
    }
    
    @IBOutlet var ExpertAdvice: UITextView!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let key = Array(Global.Variables.sessionAdvice.keys)[0] // only one piece of advice => only one key
        ExpertAdvice.text = Global.Variables.sessionAdvice[key]
        ExpertAdvice.isEditable = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
