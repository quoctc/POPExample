//
//  UITextFieldExtentions.swift
//  POPExample
//
//  Created by Quoc Tran on 10/16/17.
//  Copyright © 2017 Quoc Tran. All rights reserved.
//

import UIKit

protocol ValidatableTextField: class { }

extension ValidatableTextField where Self:UITextField {
    func isValid() -> Bool { return false }
}

class RequiredTextField: UITextField, ValidatableTextField {
    
}

class EmailTextField: UITextField, ValidatableTextField {
    func isValid() -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: self.text)
    }
}

class SecureTextField: UITextField, ValidatableTextField {
    var maxLength: Int = 0
    var minLength: Int = 0
    var isAllowNull: Bool = false
    
    func isValid() -> Bool {
        if let textLength = self.text?.characters.count {
            if textLength < minLength ||
                textLength > maxLength {
                return false
            }
            else {
                return true
            }
        }
        else {
            return isAllowNull
        }
    }
}
