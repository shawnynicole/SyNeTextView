//
//  CollectionViewCell.swift
//  MLTextField
//
//  Created by DeShawn Jackson on 4/7/18.
//  Copyright © 2018 Piive. All rights reserved.
//

import UIKit
import SyNeNextResponder
import SyNeTextView

public typealias CollectionViewCellField = SyNeTextView

public class CollectionViewCell: UICollectionViewCell, ResponderCellProtocol {
        
    public var responder: UIResponder { return field }
    
    public var isEnabled: Bool {
        get { return field.isEnabled }
        set { field.isEnabled = newValue }
    }
    
    public lazy var field: CollectionViewCellField = {
        
        let field = CollectionViewCellField()
        field.frame = bounds
        field.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
        field.editingMode = .textView
        field.clearButtonMode = .whileEditing
        field.shouldShowDoneButton = true
        field.shouldCenterVertically = false
        
        addSubview(field)
        
        return field
    }()
}

