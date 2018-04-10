//
//  +UITextView.swift
//  SyNeTextView
//
//  Created by DeShawn Jackson on 4/7/18.
//  Copyright © 2018 Piive. All rights reserved.
//

import UIKit
import SyNeNextResponder

extension UITextView {
    
    /// Getter/Setter for isEditable. Used for consistency/convenience.
    public var isEnabled: Bool {
        get { return isEditable }
        set { isEditable = newValue }
    }
}

extension UITextView {
    
    /// Determines the behavior for new line and/or tab characters
    ///
    /// - Parameters:
    /// - tab: When "\t" is found in the text, finds the next cell (ResponderCellProtocol) in a UICollectionView or UITableView and makes it the first responder
    /// - return: When "\n" or "\r" is found in the text, resignFirstResponder() is called.
    public func shouldResignOn(tab shouldTab: Bool, return shouldReturn: Bool) {
        
        if shouldReturn, let lineIndex = text?.index(where: { ["\n", "\r"].contains($0) }) {
            text.remove(at: lineIndex)
            resignFirstResponder()
        }
        
        else if shouldTab, let tabIndex = text?.index(where: { ["\t"].contains($0) }) {
            text.remove(at: tabIndex)
            goToNextCellResponder()
        }
    }
}
