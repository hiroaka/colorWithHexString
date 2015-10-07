//
//  HexUIColor.swift
//  ParseLogin
//
//  Created by Renan Rodrigues Praxedes on 07/10/15.
//  Copyright © 2015 Renanweb. All rights reserved.
//

import UIKit

extension UIColor {
    
    class func colorWithHexString (hex :String) -> UIColor {
        var cString:String = hex.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet() as NSCharacterSet).uppercaseString
        
        if (cString.hasPrefix("#")) {
            let startIndex = cString.startIndex.advancedBy(1)
            cString = cString.substringFromIndex(startIndex)
        }
        
        
        if (cString.characters.count != 6) {
            return UIColor.grayColor()
        }
        
        var rgbValue:UInt32 = 0
        NSScanner(string: cString).scanHexInt(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
