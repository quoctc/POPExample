//
//  ViewController.swift
//  POPExample
//
//  Created by Quoc Tran on 9/25/17.
//  Copyright © 2017 Quoc Tran. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var booksTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let bookCellNib = UINib(nibName: BookTableViewCell.nibName, bundle: nil)
//        booksTableView.register(bookCellNib, forCellReuseIdentifier: BookTableViewCell.reuseIdentifier)
        booksTableView.register(BookTableViewCell.self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

//for tableview datasource and delegate
extension ViewController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: BookTableViewCell.reuseIdentifier) as! BookTableViewCell
        
        cell.titleLabel.text = "abc"
        cell.authorLabel.text = "abc"
        
        return cell
    }
}

