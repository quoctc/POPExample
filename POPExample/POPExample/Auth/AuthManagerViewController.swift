//
//  AuthManagerViewController.swift
//  POPExample
//
//  Created by Quoc Tran on 10/18/17.
//  Copyright © 2017 Quoc Tran. All rights reserved.
//

import UIKit
import FirebaseAuth
import MBProgressHUD

class AuthManagerViewController: AuthViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        MBProgressHUD.showAdded(to: self.view, animated: false)
        
        
//        Auth.auth().addStateDidChangeListener {[weak self] (auth, user) in
//            loadingHud.hide(animated: false)
//            if user != nil {
//                self?.performSegue(withIdentifier: "SegueAuthManagerToMain", sender: self)
//            }
//            else {
//                self?.performSegue(withIdentifier: "SegueAuthManagerToLogin", sender: self)
//            }
//        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DispatchQueue.main.async {
            MBProgressHUD.hide(for: self.view, animated: false)
            if Auth.auth().currentUser != nil {
                self.perform(segue: .SegueAuthManagerToMain, sender: self)
            }
            else {
                self.perform(segue: .SegueAuthManagerToLogin, sender: self)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let next = segue.destination
        next.navigationItem.hidesBackButton = true
    }

}
