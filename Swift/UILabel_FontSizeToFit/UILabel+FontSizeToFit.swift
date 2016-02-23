//
//  UILabel+FontSizeToFit.swift
//  UILabel_FontSizeToFit
//
//  Created by FukuyamaShingo on 2/22/16.
//  Copyright © 2016 FukuyamaShingo. All rights reserved.
//

import UIKit

extension UILabel {
    
    func fontSizeToFit() {
        self.fontSizeToFit(minimumFontScale: 0.2, diminishRate: 0.5)
    }
    
    func fontSizeToFit(minimumFontScale minimumFontScale: CGFloat, diminishRate: CGFloat) {
        let text = self.text!
        if (text.characters.count == 0) {
            return
        }
        let size = self.frame.size
        let fontName = self.font.fontName
        let fontSize = self.font.pointSize
        let minimumFontSize = fontSize * minimumFontScale
        let isOneLine = (self.numberOfLines == 1)
        
        var boundingSize = CGSizeZero
        var area = CGSizeZero
        var font = UIFont()
        var fs = fontSize
        var newAttributes = [String : AnyObject]()
        self.attributedText?.enumerateAttributesInRange(NSMakeRange(0, text.characters.count), options: .LongestEffectiveRangeNotRequired, usingBlock: { (attributes: [String : AnyObject], range: NSRange, stop: UnsafeMutablePointer<ObjCBool>) -> Void in
            newAttributes = attributes
        })
        if newAttributes.count == 0 {
            return
        }
        while (true) {
            font = UIFont(name: fontName, size: fs)!
            newAttributes[NSFontAttributeName] = font
            
            if isOneLine {
                boundingSize = CGSize(width: CGFloat.max, height: size.height)
            }
            else {
                boundingSize = CGSize(width: size.width, height: CGFloat.max)
            }
            area = NSString(string: text).boundingRectWithSize(boundingSize, options: .UsesLineFragmentOrigin, attributes: newAttributes, context: nil).size
            if isOneLine {
                if area.width <= size.width {
                    break;
                }
            }
            else {
                if area.height <= size.height {
                    break;
                }
            }
            
            if fs == minimumFontSize {
                break;
            }
            
            fs -= diminishRate
            if fs < minimumFontSize {
                fs = minimumFontSize
            }
        }
        
        self.font = font
    }
    
}


