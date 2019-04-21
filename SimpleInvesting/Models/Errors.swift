//
//  Errors.swift
//  SimpleInvesting
//
//  Created by Antonio Rodrigues on 20/04/19.
//  Copyright © 2019 Antonio Rodrigues. All rights reserved.
//

import Foundation

enum Errors: Error {
    
    case parsing
    case connectivity
    case malformedURL
    case unknown
    
    var message: String {
        switch self {
        case .connectivity:
            return "Please check your connection and try again"
        default:
            return "An error occured. Please try again"
        }
    }
    
    var title: String {
        switch self {
        case .connectivity:
            return "Connection"
        default:
            return "Oops"
        }
    }
    
    var buttonTitle: String {
        switch self {
        case .connectivity:
            return "Try Again"
        default:
            return "Ok"
        }
    }
    
    var secodaryButtonTitle: String? {
        switch self {
        case .connectivity:
            return nil
        default:
            return "Cancel"
        }
    }
    
}
