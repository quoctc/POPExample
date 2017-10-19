//
//  ViewController.swift
//  POPExample
//
//  Created by Quoc Tran on 9/25/17.
//  Copyright © 2017 Quoc Tran. All rights reserved.
//

import UIKit

class ViewController: MainViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var booksTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Just use register for cells that define in XIB files
        //booksTableView.register(BookTableViewCell.self)
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
        let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as BookTableViewCell
        
        cell.titleLabel.text = "abc"
        cell.authorLabel.text = "abc"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.perform(segue: .SegueBooksToDetail, sender: tableView)
    }
}

