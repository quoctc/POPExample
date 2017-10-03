//
//  ReuseableTableViewCell.swift
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
//Create ReuseableView protocal
protocol ReuseableView: class {}

//ReuseableView just use for UIView
extension ReuseableView where Self: UIView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

//Make all UITableViewCell is ReuseableView
extension UITableViewCell: ReuseableView { }

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
    func register<T: UITableViewCell>(_: T.Type) where T: ReuseableView, T: NibLoadableView {
        let nib = UINib(nibName: T.nibName, bundle: nil)
        register(nib, forCellReuseIdentifier: T.reuseIdentifier)
    }
}
