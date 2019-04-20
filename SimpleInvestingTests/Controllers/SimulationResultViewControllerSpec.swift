//
//  SimulationResultViewControllerSpec.swift
//  SimpleInvestingTests
//
//  Created by Antonio Rodrigues on 20/04/19.
//  Copyright © 2019 Antonio Rodrigues. All rights reserved.
//

import Quick
import Nimble
import Nimble_Snapshots

@testable import SimpleInvesting

class SimulationResultViewControllerSpec: QuickSpec {
    
    override func spec() {
        
        var sut: SimulationResultViewController!
        
        describe("SimulationResultViewController") {
            
            context("when presenting on screen") {
                
                beforeEach {
                    let helper = JsonHelper()
                    let data = helper.dataFromFile("SimulationResponse", andContext: type(of: self))
                    let response = helper.parse(dataType: SimulationResponse.self,
                                                from: data)
                    sut = SimulationResultViewController(response: response)
                    sut.view.outlineRecursively(color: .red)
                    WindowTestHelper.show(controller: sut)
                }
                
                afterEach {
                    WindowTestHelper.clean()
                }
                
                it("must render properly") {
                    expect(sut).to(matchSnapshot(named: "SimulationResultViewController"))
                }
                
            }
            
        }
        
    }
    
}
