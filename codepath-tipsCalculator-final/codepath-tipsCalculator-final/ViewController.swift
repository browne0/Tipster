//
//  ViewController.swift
//  codepath-tipsCalculator-final
//
//  Created by Malik Browne on 12/5/15.
//  Copyright © 2015 Malik Browne. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var personTotalsView: UIView!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var onePersonTotal: UILabel!
    @IBOutlet weak var twoPersonTotal: UILabel!
    @IBOutlet weak var threePersonTotal: UILabel!
    @IBOutlet weak var fourPersonTotal: UILabel!
    @IBOutlet weak var tipControls: UISegmentedControl!
    
    func calculate()
    {
        let tipPercentages = [0.15, 0.20, 0.25]
        let tipPercentage = tipPercentages[tipControls.selectedSegmentIndex]
        
        let billAmount = NSString(string: billField.text!).doubleValue
        let tip = billAmount * tipPercentage
        let onePersonTotalVal = billAmount + tip
        let twoPersonTotalVal = (billAmount + tip) / 2
        let threePersonTotalVal = (billAmount + tip) / 3
        let fourPersonTotalVal = (billAmount + tip) / 4
        
        tipLabel.text = "$\(tip)"
        onePersonTotal.text = "$\(onePersonTotalVal)"
        twoPersonTotal.text = "$\(twoPersonTotalVal)"
        threePersonTotal.text = "$\(threePersonTotalVal)"
        fourPersonTotal.text = "$\(fourPersonTotalVal)"
        
        let formatter = NSNumberFormatter()
        formatter.numberStyle = .CurrencyStyle
        formatter.locale = NSLocale.currentLocale()
        formatter.maximumFractionDigits = 2
        
        tipLabel.text = formatter.stringFromNumber(tip)
        onePersonTotal.text = formatter.stringFromNumber(onePersonTotalVal)
        twoPersonTotal.text = formatter.stringFromNumber(twoPersonTotalVal)
        threePersonTotal.text = formatter.stringFromNumber(threePersonTotalVal)
        fourPersonTotal.text = formatter.stringFromNumber(fourPersonTotalVal)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        billField.becomeFirstResponder()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        onePersonTotal.text = "$0.00"
        twoPersonTotal.text = "$0.00"
        threePersonTotal.text = "$0.00"
        fourPersonTotal.text = "$0.00"
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        
        if (billField.text != "")
        {
            var newCenter = self.billField.center
            
            UIView.animateWithDuration(0.4, animations: {
                newCenter.y = 105
                self.billField.center = newCenter
                self.personTotalsView.alpha = 1
                self.tipControls.alpha = 1
            })
            
        }
        
        else
        {
            var newCenter = self.billField.center
            
            UIView.animateWithDuration(0.4, animations: {
                newCenter.y = 195
                self.billField.center = newCenter
                self.personTotalsView.alpha = 0
                self.tipControls.alpha = 0
            })
        }
        
        // function goes here
        calculate()
    }
    @IBAction func onTap(sender: AnyObject) {
        if (billField.text == "")
        {
            return
        }
        else
        {
            view.endEditing(true)
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

    func onEditingChanged(sender: AnyObject) {
        
        if (billField.text != "")
        {
            var newCenter = self.billField.center
            
            UIView.animateWithDuration(0.4, animations: {
                newCenter.y = 105
                self.billField.center = newCenter
                self.personTotalsView.alpha = 1
                self.tipControls.alpha = 1
            })
            
        }
        
        else
        {
            var newCenter = self.billField.center
            
            UIView.animateWithDuration(0.4, animations: {
                newCenter.y = 195
                self.billField.center = newCenter
                self.personTotalsView.alpha = 0
                self.tipControls.alpha = 0
            })
        }
        
        // function goes here
        calculate()
    }
    func onTap(sender: AnyObject) {
        if (billField.text == "")
        {
            return
        } else {
            view.endEditing(true)
        }
    }
    
    func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

        let defaults = NSUserDefaults.standardUserDefaults()
        if (defaults.objectForKey("SaveTipAmount") != nil)
        {
            tipControls.selectedSegmentIndex = defaults.integerForKey("SaveTipAmount")
            calculate()
        }
        
        if (defaults.objectForKey("billAmt") != nil)
        {
            let billAmt = defaults.objectForKey("billAmt")
            billField.text = billAmt!.string
            calculate()
        }
        
    }
    
   func viewDidDisappear(animated: Bool) {
        let time1 = NSDate(timeIntervalSinceNow: 3600)
        let time2 = NSDate()
        
        if (time1.compare(time2) == NSComparisonResult.OrderedAscending)
        {
            let defaults = NSUserDefaults.standardUserDefaults()
            
            defaults.setObject(billField.text, forKey: "billAmt")
            defaults.synchronize()
        }
    }

}

}

