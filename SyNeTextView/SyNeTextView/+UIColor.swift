//
//  UIColor.swift
//  ExtensionKit
//
//  Created by DeShawn Jackson on 7/5/16.
//  Copyright © 2016 Piive. All rights reserved.
//

import UIKit

extension UIColor {
    
    internal class func _rgb(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat, alpha: CGFloat = 1.0) -> UIColor {
        return UIColor(red: r/255, green: g/255, blue: b/255, alpha: alpha)
    }
}

extension UIColor {
    
    // MARK: - UI Items -
    
    internal class var _dodgerBlue: UIColor { return _rgb(30,144,255) }
    internal class var _disabledGray: UIColor { return .gray }
    internal class var _placeholder: UIColor { return _rgb(199,199,205) }
}
