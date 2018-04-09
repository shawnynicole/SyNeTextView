//
//  UIColor.swift
//  ExtensionKit
//
//  Created by DeShawn Jackson on 7/5/16.
//  Copyright © 2016 Piive. All rights reserved.
//

import UIKit

extension UIColor {
    
    internal class func rgb(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat, alpha: CGFloat = 1.0) -> UIColor {
        return UIColor(red: r/255, green: g/255, blue: b/255, alpha: alpha)
    }
    
    internal func rgb() -> (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat)? {
        var fRed: CGFloat = 0
        var fGreen: CGFloat = 0
        var fBlue: CGFloat = 0
        var fAlpha: CGFloat = 0
        if self.getRed(&fRed, green: &fGreen, blue: &fBlue, alpha: &fAlpha) {
            let iRed = fRed * 255.0
            let iGreen = fGreen * 255.0
            let iBlue = fBlue * 255.0
            let iAlpha = fAlpha * 255.0
            
            return (red: iRed, green: iGreen, blue: iBlue, alpha: iAlpha)
        } else {
            // Could not extract RGBA components:
            return nil
        }
    }
}

extension UIColor {
    
    // MARK: - UI Items -
    
    internal class var dodgerBlue: UIColor { return rgb(30,144,255) }
    internal class var disabledGray: UIColor { return .gray }
    internal class var placeholder: UIColor { return rgb(199,199,205) }
}
