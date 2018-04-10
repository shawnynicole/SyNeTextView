//
//  +UITableView.swift
//  SyNeNextResponder
//
//  Created by DeShawn Jackson on 4/7/18.
//  Copyright © 2018 Piive. All rights reserved.
//

import UIKit

extension UITableView {
    
    /// Returns the next valid indexPath or the first visible one.
    public func indexPath(after ip: IndexPath) -> IndexPath? {
        
        var section = ip.section
        var row = ip.row
        
        let nextIndexPath: IndexPath = {
            
            // IndexPath is last row in this section.
            if row >= (numberOfRows(inSection: section) - 1) {
                
                // IndexPath is last row in last section of UITableView.
                // Return first row in UITableView.
                if section >= (numberOfSections - 1) {
                    return IndexPath(row: 0, section: 0)
                }
                
                // Return first row in next section.
                section += 1
                return IndexPath(row: 0, section: section)
            }
            
            // Return next row in this section.
            row += 1
            return IndexPath(row: row, section: section)
        }()
        
        let first = indexPathsForVisibleRows?.sorted().first
        
        /// If cell == nil at nextIndexPath, return first visible indexPath, if applicable.
        return cellForRow(at: nextIndexPath) == nil ? first : nextIndexPath
    }
    
    /// Returns the UIResponder of the next cell that conforms to ResponderCellProtocol.
    public func cellReponder(after ip: IndexPath) -> UIResponder? {
        
        var responder: UIResponder?
        var current: IndexPath? = ip
        
        // Look for the next visible IndexPath where
        // cell conforms to ResponderCellProtocol
        // and cell.isEnabled
        while responder == nil, let currentIP = current, let nextIndexPath = self.indexPath(after: currentIP) {
            
            current = nextIndexPath
            
            if let cell = cellForRow(at: nextIndexPath) as? ResponderCellProtocol, cell.isEnabled {
                responder = cell.responder
            }
        }
        
        return responder
    }
}
