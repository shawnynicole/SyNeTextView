//
//  CenterableTextView.swift
//  SyNeTextView
//
//  Created by DeShawn Jackson on 4/9/18.
//  Copyright © 2018 Piive. All rights reserved.
//

import UIKit

open class CenterableTextView: UITextView {
    
    open var shouldCenterVertically = false
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        
        // Center Vertically
        
        if shouldCenterVertically {
            
            let fittingSize = CGSize(width: bounds.width, height: CGFloat.greatestFiniteMagnitude)
            let size = sizeThatFits(fittingSize)
            let topOffset = (bounds.size.height - size.height * zoomScale) / 2
            let positiveTopOffset = max(-9999, topOffset) //max(1, topOffset)
            contentOffset.y = -positiveTopOffset
        }
    }
}
