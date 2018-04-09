//
//  +CollectionView.swift
//  SyNeNextResponder
//
//  Created by DeShawn Jackson on 4/7/18.
//  Copyright © 2018 Piive. All rights reserved.
//

import UIKit

extension UICollectionView {

    /// Returns the next valid indexPath or the first visible one.
    public func indexPath(after ip: IndexPath) -> IndexPath? {
        
        var section = ip.section
        var item = ip.item
        
        let nextIndexPath: IndexPath = {
            
            // IndexPath is last item in this section.
            if item >= (numberOfItems(inSection: section) - 1) {
                
                // IndexPath is last item in last section of UICollectionView.
                // Return first item in UICollectionView.
                if section >= (numberOfSections - 1) {
                    return IndexPath(item: 0, section: 0)
                }
                
                // Return first item in next section.
                section += 1
                return IndexPath(item: 0, section: section)
            }
            
            // Return next item in this section
            item += 1
            return IndexPath(item: item, section: section)
        }()
        
        let first = indexPathsForVisibleItems.sorted().first
        
        /// If cell == nil at nextIndexPath, return first visible indexPath, if applicable.
        return cellForItem(at: nextIndexPath) == nil ? first : nextIndexPath
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
            
            if let cell = cellForItem(at: nextIndexPath) as? ResponderCellProtocol, cell.isEnabled {
                responder = cell.responder
            }
        }
        
        return responder
    }
}
