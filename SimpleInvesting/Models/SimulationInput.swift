//
//  SimulationInput.swift
//  SimpleInvesting
//
//  Created by Antonio Rodrigues on 20/04/19.
//  Copyright © 2019 Antonio Rodrigues. All rights reserved.
//

import Foundation

struct SimulationInput: Codable {
    
    let investedAmount: String
    let rate: String
    let maturityDate: String
    let index = "CDI"
    let isTaxFree = "false"
    
    init(investedAmount: String, rate: String, maturityDate: String) {
        self.investedAmount = investedAmount
        self.rate = rate
        self.maturityDate = maturityDate
    }
    
}
