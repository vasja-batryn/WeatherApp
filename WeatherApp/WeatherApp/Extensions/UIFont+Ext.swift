//
//  UIFont+Ext.swift
//  WeatherApp
//
//  Created by Vasja Batryn on 09.06.2023.
//

import UIKit

extension UIFont {
    
    static func urwdin(size: CGFloat, weight: UIFont.Weight) -> UIFont {
        let fontName: String

        switch weight {
            case .thin: fontName = "URWDIN-Thin"
            case .light: fontName = "URWDIN-Light"
            case .ultraLight: fontName = "URWDIN-XLight"
            case .regular: fontName = "URWDIN-Regular"
            case .medium: fontName = "URWDIN-Medium"
            case .semibold: fontName = "URWDIN-Demi"
            case .bold: fontName = "URWDIN-Bold"
            case .black: fontName = "URWDIN-Black"
            default: fontName = "URWDIN-Regular"
        }
        
        return UIFont(name: fontName, size: size)!
    }
}
