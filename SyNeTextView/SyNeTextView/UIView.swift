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
    internal func _traverseSyNeTextViewHierarchy<T: UIView>(_: T.Type, callback: ((UIView) -> Void)? = nil) -> T? {
        
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
