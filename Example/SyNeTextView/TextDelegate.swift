//
//  TextDelegate.swift
//  MLTextField
//
//  Created by DeShawn Jackson on 4/7/18.
//  Copyright © 2018 Piive. All rights reserved.
//

import UIKit

public class TextDelegate: NSObject, UITextViewDelegate, UITextFieldDelegate {
    
//    public func textViewDidChange(_ textView: UITextView) {
//        textView.shouldResignOn(tab: true, return: true)
//    }
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }
}
