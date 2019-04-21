//
//  SimpleInvestingServiceSpec.swift
//  SimpleInvestingTests
//
//  Created by Antonio Rodrigues on 20/04/19.
//  Copyright © 2019 Antonio Rodrigues. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import SimpleInvesting

class SimpleInvestingServiceSpec: QuickSpec {
    
    override func spec() {
        
        var sut: SimpleInvestingService!
        var response: SimulationResponse? = nil
        
        describe("SimpleInvestingService") {
            
            context("when fetching simulation") {
                
                beforeEach {
                    
                    sut = SimpleInvestingService(client: APIClientMock())
                    
                    let input = SimulationInput(investedAmount: "32323.0", rate: "123", maturityDate: "2023-03-03")
                    
                    sut.simulateInvestiment(input: input) { result in
                        switch result {
                        case .success(let validResponse):
                            response = validResponse
                        case .error:
                            break
                        }
                    }

                }
                
                afterEach {
                    sut = nil
                    response = nil
                }
                
                it("must return a valid response") {
                    expect(response).toNot(beNil())
                }
                
            }
            
        }
        
    }
    
}
