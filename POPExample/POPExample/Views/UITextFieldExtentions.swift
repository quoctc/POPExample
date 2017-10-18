//
//  UITextFieldExtentions.swift
//  POPExample
//
//  Created by Quoc Tran on 10/16/17.
//  Copyright © 2017 Quoc Tran. All rights reserved.
//

import UIKit

protocol ValidatableView: class { }

extension ValidatableView where Self:UIView {
    func isValid() -> Bool { return false }
    
    func notifyInvalid() {
        //get the border and red it - remove/custome those code whenever you want
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 5
        self.layer.borderColor = UIColor.red.cgColor
    }
    
    func reset() {
        self.layer.borderColor = UIColor.lightGray.cgColor
    }
}

class RequiredTextField: UITextField, ValidatableView {
    func isValid() -> Bool {
        self.reset()
        if let text = self.text, text.isEmpty == false {
            return true
        }
        self.notifyInvalid()
        return false
    }
}

class EmailTextField: RequiredTextField {
    override func isValid() -> Bool {
        if super.isValid() {
            let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
            let isValid = NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: self.text)
            if isValid == false {
                notifyInvalid()
            }
            return isValid
        }
        else {
            return false
        }
    }
}

class SecureTextField: RequiredTextField {
    var maxLength: Int = 100
    var minLength: Int = 1
    var isAllowNull: Bool = false
    
    override func isValid() -> Bool {
        if super.isValid() {
            if let textLength = self.text?.characters.count {
                if textLength < minLength ||
                    textLength > maxLength {
                    notifyInvalid()
                    return false
                }
                else {
                    /*
                    let passwordRegex = "^(?=.*[0-9a-z])(?=.*[$@$#!%*?&])[A-Z0-9a-z\\d$@$#!%*?&]"
                    let isValid = NSPredicate(format: "SELF MATCHES %@", passwordRegex).evaluate(with: self.text)
                    if isValid == false {
                        notifyInvalid()
                    }
                    return isValid
                    */
                    return true
                }
            }
            else {
                if isAllowNull == false {
                    notifyInvalid()
                }
                return isAllowNull
            }
        }
        else {
            return false
        }
    }
}
