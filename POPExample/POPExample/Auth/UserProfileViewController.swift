//
//  UserProfileViewController.swift
//  POPExample
//
//  Created by Quoc Tran on 10/18/17.
//  Copyright © 2017 Quoc Tran. All rights reserved.
//

import UIKit
import MBProgressHUD
import FirebaseAuth

class UserProfileViewController: AuthViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func touchedSignOutBtn(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            AppDelegate.resetRootViewController(to: UIStoryboard.authStoryboard().authManagerViewController())
        } catch {
            print("Sign Out error")
        }
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
