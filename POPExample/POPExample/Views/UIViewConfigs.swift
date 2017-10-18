//
//  ReusableTableViewCell.swift
//  POPExample
//
//  Created by Quoc Tran on 9/25/17.
//  Copyright © 2017 Quoc Tran. All rights reserved.
//

/*
 By using protocal oriented programming we can make app easy to develop
 */

import UIKit

//1. Reusable view protocol for the cells
//Create ReusableView protocal
protocol ReusableView: class {}

//ReusableView just use for UIView
extension ReusableView where Self: UIView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

//Make all UITableViewCell is ReusableView
extension UITableViewCell: ReusableView { }

//2. Nib load protocol for UIView
//Create Nib load protocal
protocol NibLoadableView: class {}

//NibLoadableView just use for UIView
extension NibLoadableView where Self: UIView {
    static var nibName: String {
        return String(describing: self)
    }
}

//3.
extension UITableView {
    func register<T: UITableViewCell>(_: T.Type) where T: ReusableView, T: NibLoadableView {
        let Nib = UINib(nibName: T.nibName, bundle: nil)
        register(Nib, forCellReuseIdentifier: T.reuseIdentifier)
    }
}

//4
extension UITableView {
    func dequeueReusableCell<T: UITableViewCell>(forIndexPath indexPath: IndexPath) -> T where T: ReusableView {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        return cell
    }
}
