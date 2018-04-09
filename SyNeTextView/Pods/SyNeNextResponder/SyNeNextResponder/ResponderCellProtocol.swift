//
//  ResponderCellProtocol.swift
//  SyNeNextResponder
//
//  Created by DeShawn Jackson on 4/7/18.
//  Copyright © 2018 Piive. All rights reserved.
//

import UIKit

/// Typical usage is for UICollectionViewCell and UITableViewCell
public protocol ResponderCellProtocol: NSObjectProtocol {

    /// Return a responder (i.e. UITextField, UITextView, etc.)
    var responder: UIResponder { get }
    
    /// Return the responder's isEnabled/isEditable property (i.e. UITextField.isEnabled, UITextView.isEditable, etc.)
    var isEnabled: Bool { get }
}
