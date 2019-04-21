//
//  SimulationResultHeaderViewSpec.swift
//  SimpleInvestingTests
//
//  Created by Antonio Rodrigues on 20/04/19.
//  Copyright © 2019 Antonio Rodrigues. All rights reserved.
//

import Quick
import Nimble
import Nimble_Snapshots

@testable import SimpleInvesting

class SimulationResultHeaderViewSpec: QuickSpec {
    
    override func spec() {
        
        var sut: SimulationResultHeaderView!
        
        describe("SimulationResultHeaderView") {
            
            context("when presenting on screen") {
                
                beforeEach {
                    let grossAmount = 1042.99
                    let profit = 42.99
                    let config = SimulationResultHeaderView.Configuration(grossAmount: grossAmount, profit: profit)
                    let frame = CGRect(x: 0, y: 0, width: 200, height: 100)
                    sut = SimulationResultHeaderView(frame: frame)
                    sut.setup(with: config)
                }
                
                it("must render properly") {
                    expect(sut).to(matchSnapshot(named: "SimulationResultHeaderView"))
                }
                
            }
            
        }
        
    }
    
}
