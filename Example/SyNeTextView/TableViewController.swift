//
//  TableViewController.swift
//  MLTextField
//
//  Created by DeShawn Jackson on 4/7/18.
//  Copyright © 2018 Piive. All rights reserved.
//

import UIKit

public class TableViewController: UITableViewController {

    public let textDelegate = TextDelegate()

    // MARK: - Table view data source

    public override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        if indexPath.row % 3 == 0 && indexPath.row != 0 && indexPath.row != 9 {
            cell.field.isEnabled = false
        }
        
        let text = "\(indexPath) \(cell.field.isEnabled ? "ENABLED" : "DISABLED")"
        
        if !cell.field.isEnabled || indexPath.row % 2 == 0 {
            cell.field.text = text
        }
        
        cell.field.placeholder = text
        cell.field.delegate = textDelegate
        

        return cell
    }
    
    // MARK: - Table view delegate
    
    open override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(#function, indexPath)
    }
}
