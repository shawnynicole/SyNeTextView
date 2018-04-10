//
//  +UIView.swift
//  SyNeNextResponder
//
//  Created by DeShawn Jackson on 4/7/18.
//  Copyright © 2018 Piive. All rights reserved.
//

import UIKit

extension UIView {
    
    /// Traverse view hierarchy ancestors for view of specific type
    internal func _traverseViewHierarchy<T: UIView>(_: T.Type, callback: ((UIView) -> Void)? = nil) -> T? {
        
        var currentView = self
        
        while let parentView = currentView.superview {
            
            /// Allows processing on each item found
            callback?(parentView)
            
            if let found = parentView as? T {
                return found
            }
            
            currentView = parentView
        }
        
        return nil
    }
}

extension UIView {
    
    /// Returns the next cell (ResponderCellProtocol) in a UICollectionView or UITableView.
    public var nextCellResponder: UIResponder? {
        
        // Traverse the view hierarchy to find the UICollectionViewCell or UITableViewCell
        // Traverse the view hierarchy to find the UICollectionView or UITableView
        // Obtain the indexPath for this view's cell
        // Obtain the ResponderCellProtocol.responder for the next IndexPath
        
        if let cell = _traverseViewHierarchy(UICollectionViewCell.self) {
            
            let collectionView = _traverseViewHierarchy(UICollectionView.self)
            guard let indexPath = collectionView?.indexPath(for: cell) else { return nil }
            return collectionView?.cellReponder(after: indexPath)
        }
        
        if let cell = _traverseViewHierarchy(UITableViewCell.self) {
            
            let tableView = _traverseViewHierarchy(UITableView.self)
            guard let indexPath = tableView?.indexPath(for: cell) else { return nil }
            return tableView?.cellReponder(after: indexPath)
        }
        
        return nil
    }
    
    /// Finds the next ResponderCellProtocol.responder in a UICollectionView or UITableView and makes it the first responder
    /// and/or resigns first responder for self.
    public func goToNextCellResponder() {
        
        let relinquished = nextCellResponder?.becomeFirstResponder() ?? false
        
        if !relinquished {
            resignFirstResponder()
        }
    }
}
