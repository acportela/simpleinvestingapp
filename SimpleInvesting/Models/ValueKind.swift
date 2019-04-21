//
//  ValueKind.swift
//  SimpleInvesting
//
//  Created by Antonio Rodrigues on 19/04/19.
//  Copyright © 2019 Antonio Rodrigues. All rights reserved.
//

import Foundation

enum ValueKind {
    
    case capital(value: Double)
    case rate(value: Double)
    case capitalAndRate(capital: Double, rate: Double)
    case date(value: Date)
    case integer(Int)
    
    var formatted: String {
        
        switch self {
            
        case .capital(let value):
            
            return value.currencyDescription
            
        case .rate(let value):
            
            return "\(value.percentDescription)%"
            
        case .capitalAndRate(let value):
            
            let capitalFormatted = value.capital.currencyDescription
            let percentageFormatted = value.rate.percentDescription
            return "\(capitalFormatted)(\(percentageFormatted)%)"
            
        case .date(let value):
            
            let calendar = Calendar.current
            let day = calendar.component(.day, from: value)
            let month = calendar.component(.month, from: value)
            let year = calendar.component(.year, from: value)
            
            return "\(day)/\(month)/\(year)"
            
        case .integer(let value):
            
            return value.description
            
        }
        
    }
    
}
