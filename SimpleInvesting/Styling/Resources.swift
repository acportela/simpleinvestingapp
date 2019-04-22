//
//  Resources.swift
//  SimpleInvesting
//
//  Created by Antonio Rodrigues on 18/04/19.
//  Copyright © 2019 Antonio Rodrigues. All rights reserved.
//

import UIKit

enum Resources {
    enum Colors {}
    enum Fonts {}
}

extension Resources.Colors {
    
    static let black =  UIColor(red: 45, green: 45, blue: 45)
    static let lightGrey =  UIColor(red: 174, green: 180, blue: 184)
    static let grey =  UIColor(red: 112, green: 112, blue: 112)
    static let green =  UIColor(red: 0, green: 193, blue: 170)
    static let white =  UIColor(red: 255, green: 255, blue: 255)

}

extension Resources.Fonts {
    
    static func light(ofSize size: CGFloat) -> UIFont {
        return font(named: "ProximaNova-Light", size: size)
    }

    static func regular(ofSize size: CGFloat) -> UIFont {
        return font(named: "ProximaNova-Regular", size: size)
    }
    
    private static func font(named: String, size: CGFloat) -> UIFont {
        
        guard let font = UIFont(name: named, size: size) else {
            fatalError("The font \(named) was not found")
        }
        
        return font
        
    }
    
}
