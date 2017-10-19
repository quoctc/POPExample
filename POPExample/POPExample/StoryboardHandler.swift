//
//  StoryboardExtension.swift
//  POPExample
//
//  Created by Quoc Tran on 10/18/17.
//  Copyright © 2017 Quoc Tran. All rights reserved.
//

import UIKit

enum ViewControllerStoryboardIds: String {
    case AuthNavigationController
}

extension UIStoryboard {
    class func auth() -> UIStoryboard {
        let authStoryboard = UIStoryboard(name: "Auth", bundle: nil)
        return authStoryboard
    }
    
    class func main() -> UIStoryboard {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        return mainStoryboard
    }
    
    func initialViewController() -> UIViewController {
        if let initialViewController = self.instantiateInitialViewController() {
            return initialViewController
        }
        else {
            return UIViewController()
        }
    }
}
