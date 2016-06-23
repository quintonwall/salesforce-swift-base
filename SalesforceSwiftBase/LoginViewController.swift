//
//  ViewController.swift
//  SalesforceSwiftBase
//
//  Created by Quinton Wall on 6/23/16.
//  Copyright © 2016 Quinton Wall. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, SFAuthenticationManagerDelegate {
    
    
    @IBOutlet weak var connectButton: UIButton!
    
    
    override func viewWillAppear(animated: Bool) {
        SFAuthenticationManager.sharedManager().addDelegate(self)
        
        connectButton.backgroundColor = UIColor.clearColor()
        connectButton.layer.cornerRadius = 5
        connectButton.layer.borderWidth = 1
        connectButton.layer.borderColor = UIColor.whiteColor().CGColor
        
        if SFAuthenticationManager.sharedManager().haveValidSession {
            print("VALID")
            dispatch_async(dispatch_get_main_queue()){
                
                self.performSegueWithIdentifier("loggedinview", sender: self)
                
            }
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Salesforce Base App"
        
        
    }
    
    
    @IBAction func connectTapped(sender: AnyObject) {
        
        SalesforceSDKManager.sharedManager().launch()
    }
    
    func authManagerDidFinish(manager: SFAuthenticationManager!, info: SFOAuthInfo!) {
        
        //need to perform this check at the end of the authmanager lifecycle
        //because SFRootViewManager removes the current view after didAUthenticate gets called :(
        
        if SFAuthenticationManager.sharedManager().haveValidSession {
            
            self.performSegueWithIdentifier("loggedinview", sender: nil)
        }
    }
    
}


