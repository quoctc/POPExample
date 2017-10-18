//
//  LoginViewController.swift
//  POPExample
//
//  Created by Quoc Tran on 10/3/17.
//  Copyright © 2017 Quoc Tran. All rights reserved.
//

import UIKit

class LoginViewController: AuthViewController {

    @IBOutlet weak var userNameTextField: EmailTextField!
    @IBOutlet weak var passwordTextField: SecureTextField!
    @IBOutlet var requiredUIItems: [RequiredTextField]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - 
    func collectDataFromUIs() {
        
    }
    
    func isValidDataFromUIs() -> Bool {
        var isValid = true
        for item in requiredUIItems {
            isValid = isValid && item.isValid()
        }
        
        return isValid
    }
    
    // MARK: - UI Actions
    @IBAction func touchedLoginBtn(_ sender: Any) {
        self.isValidDataFromUIs()
    }
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to check some criticals before navigation, it its does match criticals. May be you want to stop that navigation
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        return true
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
}
