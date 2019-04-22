//
//  DoubleExtension.swift
//  SimpleInvesting
//
//  Created by Antonio Rodrigues on 19/04/19.
//  Copyright © 2019 Antonio Rodrigues. All rights reserved.
//

import Foundation

extension Double {
    
    var currencyDescription: String {
    
        guard var currencyValue = formattedNumberForStyle(.currency) else {
            return ""
        }
        
        guard let symbol = currencyValue.firstIndex(of: "$") else {
            return currencyValue
        }
        
        currencyValue.insert(" ", at: currencyValue.index(after: symbol))
        return currencyValue
        
    }
    
    var percentDescription: String {
        return formattedNumberForStyle(.decimal) ?? ""
    }
    
    func formattedNumberForStyle(_ style: NumberFormatter.Style) -> String? {
        
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = style
        formatter.locale = Locale.current
        
        return formatter.string(from: NSNumber(value: self))
        
    }
    
    func plainDescription() -> String? {
        
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = false
        formatter.numberStyle = .none
        formatter.locale = Locale.current
        
        return formatter.string(from: NSNumber(value: self))
        
    }
    
}
