//
//  UIColor+Utility.swift
//  GMProjectEuler
//
//  Created by Mustafa on 09/02/2015.
//  Copyright (c) 2015 Learning. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    class func colorWithHexRGB(hexRGBValue:String) -> UIColor {
        var color: UIColor = UIColor.lightGrayColor();
        var hexValue: String = hexRGBValue
        
        if hexValue.hasPrefix("#") {
            hexValue = hexValue.substringFromIndex(advance(hexValue.startIndex, 1))
        }
        
        if hexValue.utf16Count == 6 {
            let scanner = NSScanner(string: hexRGBValue)

            var hexInt: UInt32 = 0
            var result = scanner.scanHexInt(&hexInt)
            
            var red: CGFloat = (CGFloat)(((hexInt & 0xFF0000) >> 16) / 255)
            var green: CGFloat = (CGFloat)(((hexInt & 0xFF00) >> 8) / 255)
            var blue: CGFloat = (CGFloat)(((hexInt & 0xFF) >> 8) / 255)
            
            color = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        }
        
        return color;
    }
    
    class func defaultTintColor() -> UIColor {
        var color: UIColor = UIColor(red: 255/255, green: 149/255, blue: 63/255, alpha: 1.0)
        
        return color;
    }
    
    class func defaultLightTintColor() -> UIColor {
        var color: UIColor = UIColor(red: 255/255, green: 187/255, blue: 57/255, alpha: 1.0)
        
        return color;
    }

    class func defaultDarkTintColor() -> UIColor {
        var color: UIColor = UIColor(red: 255/255, green: 72/255, blue: 0/255, alpha: 1.0)
        
        return color;
    }

    class func lightTintRedColor() -> UIColor {
        var color: UIColor = UIColor(red: 255/255, green: 223/255, blue: 223/255, alpha: 1.0)
        
        return color;
    }
    
    class func lightTintGreenColor() -> UIColor {
        var color: UIColor = UIColor(red: 223/255, green: 255/255, blue: 233/255, alpha: 1.0)
        
        return color;
    }
    
    class func lightTintBlueColor() -> UIColor {
        var color: UIColor = UIColor(red: 233/255, green: 240/255, blue: 255/255, alpha: 1.0)
        
        return color;
    }
    
    class func lightTintOrangeColor() -> UIColor {
        var color: UIColor = UIColor(red: 255/255, green: 239/255, blue: 213/255, alpha: 1.0)
        
        return color;
    }
    
    class func lightTintGreyColor() -> UIColor {
        var color: UIColor = UIColor(red: 224/255, green: 224/255, blue: 224/255, alpha: 1.0)
        
        return color;
    }
}
