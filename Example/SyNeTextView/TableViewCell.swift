//
//  TableViewCell.swift
//  MLTextField
//
//  Created by DeShawn Jackson on 4/7/18.
//  Copyright © 2018 Piive. All rights reserved.
//

import UIKit
import SyNeNextResponder
import SyNeTextView

public typealias TableViewCellField = SyNeTextView

public class TableViewCell: UITableViewCell, ResponderCellProtocol {
    
    public var responder: UIResponder { return field }
    
    public var isEnabled: Bool {
        get { return field.isEnabled }
        set { field.isEnabled = newValue }
    }
    
    public lazy var field: TableViewCellField = {
        
        let field = TableViewCellField()
        
        field.frame = bounds
        field.translatesAutoresizingMaskIntoConstraints = true
        field.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
        field.editingMode = .textField
        field.clearButtonMode = .whileEditing
        field.shouldShowDoneButton = false
        field.shouldCenterVertically = true
        
        addSubview(field)

        return field
    }()
}




