//
//  ViewController.swift
//  TableViewInCellDemo
//
//  Created by Itsuki on 2024/02/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var mainTableView: UITableView!
    
    var sectionOneItems = ["item 1 in section 1", "item 2 in section 1", "item 3 in section 1", ]
    var sectionThreeItems = ["item 1 in section 3", "item 2 in section 3", "item 3 in section 3", ]

    var tableItems =
        ["item 1-1 in table cell super long \n super long \nsuper long \nsuper long \nsuper long \nsuper long \nsuper long \nsuper long \n", "item 1-2  ", "item 1-3 in table cell"]
//        ["item 2-1 in table cell", "item 2-2 in table cell", "item 2-3 in table cell"],
//        ["item 3-1 in table cell", "item 3-2 in table cell", "item 3-3 in table cell"]
    
    
//    var dataSource: Array<Array<String>> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        dataSource = [sectionOneItems, tableItems, sectionThreeItems]
        
        mainTableView.delegate = self
        mainTableView.dataSource = self
        mainTableView.register(UINib(nibName: TableCell.cellIdentifier, bundle: nil), forCellReuseIdentifier: TableCell.cellIdentifier)
        mainTableView.register(UINib(nibName: RegularCell.cellIdentifier, bundle: nil), forCellReuseIdentifier: RegularCell.cellIdentifier)
        
        mainTableView.estimatedRowHeight = 80
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        4
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 1 || section == 3 {
            return 1
        } else {
            return 3
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 1 || indexPath.section == 3 {
            let cell = mainTableView.dequeueReusableCell(withIdentifier: TableCell.cellIdentifier, for: indexPath) as! TableCell
            cell.items = tableItems
            return cell

        } else {
            let cell = mainTableView.dequeueReusableCell(withIdentifier: RegularCell.cellIdentifier, for: indexPath) as! RegularCell
            cell.label.text = sectionOneItems[indexPath.row]
            return cell
        }
    }

}
