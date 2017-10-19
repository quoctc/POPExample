//
//  LoginViewController.swift
//  POPExample
//
//  Created by Quoc Tran on 10/3/17.
//  Copyright © 2017 Quoc Tran. All rights reserved.
//

import UIKit
import FirebaseAuth
import MBProgressHUD

class LoginViewController: AuthViewController, UITextFieldDelegate {

    @IBOutlet weak var userNameTextField: EmailTextField!
    @IBOutlet weak var passwordTextField: SecureTextField!
    @IBOutlet var requiredUIItems: [RequiredTextField]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Hide back button
        self.navigationItem.hidesBackButton = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
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
            let validItem = item.isValid()
            isValid = isValid && validItem
            //if isValid == false { break }
        }
        
        return isValid
    }
    
    // MARK: - UI Actions
    @IBAction func touchedLoginBtn(_ sender: Any) {
        self.view.endEditing(true)
        if self.isValidDataFromUIs() == true {
            let loadingHud = MBProgressHUD.showAdded(to: self.view, animated: false)
            Auth.auth().signIn(withEmail: userNameTextField.text!, password: passwordTextField.text!, completion: {[weak self] (user, error) in
                loadingHud.hide(animated: false)
                if error != nil {
                    let alert = UIAlertController(title: "Error!", message: error?.localizedDescription, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
                        alert.dismiss(animated: true, completion: nil)
                    }))
                    self?.present(alert, animated: true, completion: nil)
                }
                else {
                    self?.performSegue(withIdentifier: "SegueLoginToMain", sender: sender)
                }
            })
        }
    }
    
    // MARK: - Textfield Delegates
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.touchedLoginBtn(textField)
        
        return true
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to check some criticals before navigation, it its does match criticals. May be you want to stop that navigation
    //override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
    //    return true
    //}
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "SegueLoginToMain" {
            let main = segue.destination
            main.navigationItem.hidesBackButton = true
        }
    }
}
