//
//  +UIFont.swift
//  SyNeTextView
//
//  Created by DeShawn Jackson on 11/20/17.
//  Copyright © 2017 Piive. All rights reserved.
//

import UIKit

extension UIFont {
    
    internal func _withTraits(_ traits: UIFontDescriptorSymbolicTraits) -> UIFont {
        
        // create a new font descriptor with the given traits
        if let fd = fontDescriptor.withSymbolicTraits(traits) {
            // return a new font with the created font descriptor
            return UIFont(descriptor: fd, size: pointSize)
        }
        
        // the given traits couldn't be applied, return self
        return self
    }
    
    internal func _bold() -> UIFont {
        return _withTraits(.traitBold)
    }
}


