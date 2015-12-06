//
//  SettingsViewController.swift
//  codepath-tipsCalculator-final
//
//  Created by Malik Browne on 12/5/15.
//  Copyright © 2015 Malik Browne. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tipControl: UISegmentedControl!
    
    @IBAction func saveTipAmount(sender: AnyObject) {
        
        let defaults = NSUserDefaults.standardUserDefaults()
        
        if (tipControl.selectedSegmentIndex == 0)
        {
            defaults.setInteger(0, forKey: "SaveTipAmount")
<<<<<<< HEAD
            defaults.synchronize()
=======
>>>>>>> a8409f5ec9c4268c0159daa0d576adb94aef60e9
        }
        
        else if (tipControl.selectedSegmentIndex == 1)
        {
            defaults.setInteger(1, forKey: "SaveTipAmount")
<<<<<<< HEAD
            defaults.synchronize()
=======
>>>>>>> a8409f5ec9c4268c0159daa0d576adb94aef60e9
        }
        
        else if (tipControl.selectedSegmentIndex == 2)
        {
            defaults.setInteger(2, forKey: "SaveTipAmount")
<<<<<<< HEAD
            defaults.synchronize()
=======
>>>>>>> a8409f5ec9c4268c0159daa0d576adb94aef60e9
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = NSUserDefaults.standardUserDefaults()
        
        if (defaults.objectForKey("SaveTipAmount") != nil)
        {
            tipControl.selectedSegmentIndex = defaults.integerForKey("SaveTipAmount")
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
