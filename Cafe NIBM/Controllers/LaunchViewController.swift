//
//  LaunchViewController.swift
//  Cafe NIBM
//
//  Created by Heshan on 4/12/21.
//  Copyright © 2021 Heshan. All rights reserved.
//

import UIKit

class LaunchViewController: UIViewController {

    let sessionMGR = SessionManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //Check whether user is LOGGED IN
    override func viewDidAppear(_ animated: Bool) {
        if sessionMGR.getLoggedState(){
            self.performSegue(withIdentifier: "LaunchToHome", sender: nil)
        } else{
            self.performSegue(withIdentifier: "LaunchToSignIn", sender: nil)
        }
    }
    

}
