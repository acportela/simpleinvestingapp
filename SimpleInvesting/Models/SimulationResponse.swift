//
//  SimulationResponse.swift
//  SimpleInvesting
//
//  Created by Antonio Rodrigues on 20/04/19.
//  Copyright © 2019 Antonio Rodrigues. All rights reserved.
//

import Foundation

struct SimulationResponse: Codable {
    
    let grossAmount: Double?
    let taxesAmount: Double?
    let netAmount: Double?
    let grossAmountProfit: Double?
    let annualGrossRateProfit: Double?
    let rateProfit: Double?
    let monthlyGrossRateProfit: Double?
    let taxesRate: Double?
    let investmentParameter: InvestmentParameter?
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        grossAmount = try container.decodeIfPresent(Double.self, forKey: .grossAmount)
        taxesAmount = try container.decodeIfPresent(Double.self, forKey: .taxesAmount)
        netAmount = try container.decodeIfPresent(Double.self, forKey: .netAmount)
        grossAmountProfit = try container.decodeIfPresent(Double.self, forKey: .grossAmountProfit)
        annualGrossRateProfit = try container.decodeIfPresent(Double.self, forKey: .annualGrossRateProfit)
        rateProfit = try container.decodeIfPresent(Double.self, forKey: .rateProfit)
        monthlyGrossRateProfit = try container.decodeIfPresent(Double.self, forKey: .monthlyGrossRateProfit)
        taxesRate = try container.decodeIfPresent(Double.self, forKey: .taxesRate)
        investmentParameter = try container.decodeIfPresent(InvestmentParameter.self, forKey: .investmentParameter)
    }
    
}

struct InvestmentParameter: Codable {
    
    let investedAmount: Double?
    let yearlyInterestRate: Double?
    let maturityDate: String?
    let maturityTotalDays: Int?
    let rate: Double?
    let isTaxFree: Bool?
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        investedAmount = try container.decodeIfPresent(Double.self, forKey: .investedAmount)
        yearlyInterestRate = try container.decodeIfPresent(Double.self, forKey: .yearlyInterestRate)
        maturityTotalDays = try container.decodeIfPresent(Int.self, forKey: .maturityTotalDays)
        maturityDate = try container.decodeIfPresent(String.self, forKey: .maturityDate)
        rate = try container.decodeIfPresent(Double.self, forKey: .rate)
        isTaxFree = try container.decodeIfPresent(Bool.self, forKey: .isTaxFree)
    }
    
}
