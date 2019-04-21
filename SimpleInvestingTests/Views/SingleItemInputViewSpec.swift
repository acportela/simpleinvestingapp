//
//  SingleItemInputViewSpec.swift
//  SimpleInvestingTests
//
//  Created by Antonio Rodrigues on 20/04/19.
//  Copyright © 2019 Antonio Rodrigues. All rights reserved.
//

import Quick
import Nimble
import Nimble_Snapshots

@testable import SimpleInvesting

class SingleItemInputViewSpec: QuickSpec {
    
    override func spec() {
        
        var sut: InvestimentInputView!
        
        describe("SingleItemInputView") {
            
            context("when presenting on screen") {
                
                context("with investiment type") {
                    
                    beforeEach {
                        let config = InvestimentInputView.Configuration(inputType: .investiment)
                        let frame = CGRect(x: 0, y: 0, width: 651, height: 66)
                        sut = InvestimentInputView(frame: frame, config: config)
                    }
                    
                    it("must render properly") {
                        expect(sut).to(matchSnapshot(named: "SingleItemInputView_Investiment"))
                    }
                    
                }
                
                context("with maturity date type") {
                    
                    beforeEach {
                        let config = InvestimentInputView.Configuration(inputType: .maturityDate)
                        let frame = CGRect(x: 0, y: 0, width: 651, height: 66)
                        sut = InvestimentInputView(frame: frame, config: config)
                    }
                    
                    it("must render properly") {
                        expect(sut).to(matchSnapshot(named: "SimulationResultHeaderView_Date"))
                    }
                    
                }
                
                context("with rate type") {
                    
                    beforeEach {
                        let config = InvestimentInputView.Configuration(inputType: .rate)
                        let frame = CGRect(x: 0, y: 0, width: 651, height: 66)
                        sut = InvestimentInputView(frame: frame, config: config)
                    }
                    
                    it("must render properly") {
                        expect(sut).to(matchSnapshot(named: "SimulationResultHeaderView_Rate"))
                    }
                    
                }
                
            }
            
        }
        
    }
    
}
