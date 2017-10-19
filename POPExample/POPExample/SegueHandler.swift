//
//  SegueHandlerType.swift
//  POPExample
//
//  Created by Quoc Tran on 10/19/17.
//  Copyright © 2017 Quoc Tran. All rights reserved.
//

import Foundation
import UIKit

protocol SegueHandler {
    associatedtype SegueIdentifier: RawRepresentable
}

extension SegueHandler where Self:UIViewController, SegueIdentifier.RawValue == String {
    func perform(segue identifier: SegueIdentifier, sender: Any) {
        performSegue(withIdentifier: identifier.rawValue, sender: sender)
    }
    
    func segueIdentifier(for segue: UIStoryboardSegue) -> SegueIdentifier {
        // still have to use guard stuff here, but at least you're
        // extracting it this time
        guard let identifier = segue.identifier,
            let segueIdentifier = SegueIdentifier(rawValue: identifier) else {
                fatalError("Invalid segue identifier \(segue.identifier ?? "nil").") }
        
        return segueIdentifier
    }
}

extension AuthViewController: SegueHandler {
    enum SegueIdentifier: String {
        case SegueLoginToMain
        case SegueSignUpToMain
        case SegueAuthManagerToMain
        case SegueAuthManagerToLogin
    }
}

extension MainViewController: SegueHandler {
    enum SegueIdentifier: String {
        case SegueBooksToDetail
    }
}
