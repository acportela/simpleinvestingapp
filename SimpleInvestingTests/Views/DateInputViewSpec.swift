//
//  DateInputViewSpec.swift
//  SimpleInvestingTests
//
//  Created by Antonio Rodrigues on 22/04/19.
//  Copyright © 2019 Antonio Rodrigues. All rights reserved.
//

import Quick
import Nimble
import Nimble_Snapshots

@testable import SimpleInvesting

class DateInputViewSpec: QuickSpec {
    
    override func spec() {
        
        var sut: DateInputView!
        
        describe("DateInputView") {
            
            context("when presenting on screen") {
                
                beforeEach {
                    let frame = CGRect(x: 0, y: 0, width: 651, height: 66)
                    sut = DateInputView(frame: frame)
                }
                
                it("must render properly") {
                    expect(sut).to(matchSnapshot(named: "DateInputView"))
                }
                
            }
            
        }
        
    }
    
}
