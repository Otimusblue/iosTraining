//
//  ItemsViewController.swift
//  Homepwner
//
//  Created by Macintosh HD on 3/4/18.
//  Copyright © 2018 google. All rights reserved.
//

import UIKit

class ItemsViewController :  UITableViewController{
    var filteredItems = [[Item]]()
    var itemStore : ItemStore!{
        didSet {
            // reload table each time new data is set
            filteredItems = itemStore.filterItemsBy()
            self.tableView.reloadData()
        }
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Get the height of the status bar
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        let insets = UIEdgeInsets(top: statusBarHeight, left: 0, bottom: 0, right: 0)
        tableView.contentInset = insets
        tableView.scrollIndicatorInsets = insets
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return filteredItems.count
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Over $50"
        case 1:
            return "Under $50"
        default:
            return nil
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredItems[section].count
    }
    
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//           return itemStore.allItems.count
//    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let item = filteredItems[indexPath.section][indexPath.row]
        
        // this is better for memory management but must be configued in IB
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = "$\(item.valueInDollars)"
        
        return cell
        
    }

//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
//       //let cell = UITableViewCell(style: .value1, reuseIdentifier: "UITableViewCell")
//        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell",for: indexPath)
//       let item = itemStore.allItems[indexPath.row]
//       cell.textLabel?.text = item.name
//       cell.detailTextLabel?.text = "$\(item.valueInDollars)"
//        
//       return cell
//    }
}

