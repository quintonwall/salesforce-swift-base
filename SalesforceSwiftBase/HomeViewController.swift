//
//  HomeViewController.swift
//  SalesforceSwiftBase
//
//  Created by Quinton Wall on 6/23/16.
//  Copyright © 2016 Quinton Wall. All rights reserved.
//

import Foundation
import UIKit


class HomeController: UIViewController {
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        
        if  !SFAuthenticationManager.sharedManager().haveValidSession {
            //self.performSegueWithIdentifier("login", sender: self)
        }
    }
    
}