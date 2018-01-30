//
//  HeightViewController.swift
//  PrehabGUI
//
//  Created by Teofilo Zosa on 9/20/17.
//  Copyright © 2017 Teofilo Zosa. All rights reserved.
//

import UIKit

class HeightViewController: UIViewController {

    @IBAction func PoleUp(_ sender: UIButton) {
        Global.Variables.sharedDouble.poleUp()
    }
    
    @IBAction func Stop(_ sender: UIButton) {
        Global.Variables.sharedDouble.poleStop()
    }
    
    @IBAction func PoleDown(_ sender: UIButton) {
        Global.Variables.sharedDouble.poleDown()
    }
    
    @IBAction func back(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)

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
