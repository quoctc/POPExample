//
//  StoryboardExtension.swift
//  POPExample
//
//  Created by Quoc Tran on 10/18/17.
//  Copyright © 2017 Quoc Tran. All rights reserved.
//

import UIKit

extension UIStoryboard {
    class func authStoryboard() -> UIStoryboard {
        let authStoryboard = UIStoryboard(name: "Auth", bundle: nil)
        return authStoryboard
    }
    
    func authManagerViewController() -> UIViewController {
        return self.instantiateViewController(withIdentifier: "AuthManagerViewController")
    }
    
    //
    class func mainStoryboard() -> UIStoryboard {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        return mainStoryboard
    }
}
