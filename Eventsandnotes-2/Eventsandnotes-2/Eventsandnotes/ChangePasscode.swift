//
//  ChangePasscode.swift
//  Eventsandnotes
//
//  Created by Ganesh on 8/11/16.
//  Copyright © 2016 Ganesh. All rights reserved.
//

import UIKit

class ChangePasscode: UIViewController, UITextFieldDelegate
{
    var changepassword = ""
    
    func handleInput(str: String)
    {
        
        
        ChangePasscodeTextField.text = ChangePasscodeTextField.text! + str
        
        if ChangePasscodeTextField.text?.characters.count == 4
        {
            changepassword = ChangePasscodeTextField.text!
            ChangePasscodeTextField.text = ""
            
            let changingPassword: NSString = changepassword
            NSUserDefaults.standardUserDefaults().setObject(changingPassword, forKey:"changepassword")
            NSUserDefaults.standardUserDefaults().synchronize()
            
            if changingPassword == NSUserDefaults.standardUserDefaults().stringForKey("setpassword")
            {
                print(" Current Password \(changingPassword)")
                NSUserDefaults.standardUserDefaults().setValue(nil, forKey: "setpassword")
                let next = self.storyboard?.instantiateViewControllerWithIdentifier("SetPasscodeViewController") as! SetPasscodeViewController
                
                self.presentViewController(next, animated: true, completion: nil)
            }
                
            else
            {
                UIAlertView.init(title: "Failed", message: "Please enter Correct Password", delegate: nil, cancelButtonTitle: "OK").show()
                return
            }
        }
        
        
        
    }
    
    @IBOutlet weak var ChangePasscodeLabel: UILabel!

    @IBOutlet weak var ChangePasscodeTextField: UITextField!
    @IBAction func btnAction(sender: CustomButton)
    {
        handleInput("\(sender.tag)")
    }

    @IBOutlet weak var ButtonDelete: UIButton!
    @IBOutlet weak var ButtonClear: UIButton!
    

    
    @IBAction func ButtonDeletePress(sender: UIButton)
    {
        let name: String = self.ChangePasscodeTextField.text!
        let stringLength = ChangePasscodeTextField.text?.characters.count
        let substringIndex = stringLength! - 1
        ChangePasscodeTextField.text = (name as NSString).substringToIndex(substringIndex)
    }
    
    @IBAction func ButtonClearPress(sender: UIButton)
    {
        ChangePasscodeTextField.text = ""
    }
    
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.navigationController?.navigationBar.barTintColor = UIColor.blueColor()
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        

        ChangePasscodeTextField.delegate = self
           }
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
