//
//  Font+Ext.swift
//  WeatherApp
//
//  Created by Vasja Batryn on 09.06.2023.
//

import SwiftUI

extension Font {
    
    static func urwdin(size: CGFloat, weight: Font.Weight) -> Font {
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
        
        return Font.custom(fontName, size: size)
    }
}
