//
//  SimpleItemResultViewSpec.swift
//  SimpleInvestingTests
//
//  Created by Antonio Rodrigues on 20/04/19.
//  Copyright © 2019 Antonio Rodrigues. All rights reserved.
//

import Quick
import Nimble
import Nimble_Snapshots

@testable import SimpleInvesting

class SimpleItemResultViewSpec: QuickSpec {
    
    override func spec() {
        
        var sut: SingleItemResultView!
        
        describe("SimpleItemResultView") {
            
            context("when presenting on screen") {
                
                context("a capital value") {
                    
                    beforeEach {
                        let kind = ValueKind.capital(value: 1234000.78)
                        prepareSut(kind: kind)
                    }
                    
                    it("must render properly") {
                        expect(sut).to(matchSnapshot(named: "SimpleItemResultView_Capital"))
                    }
                    
                }
                
                
                
                context("a rate value") {
                    
                    beforeEach {
                        let kind = ValueKind.rate(value: 1232.32)
                        prepareSut(kind: kind)
                    }
                    
                    it("must render properly") {
                        expect(sut).to(matchSnapshot(named: "SimpleItemResultView_Rate"))
                    }
                    
                }
                
                context("a capital and rate value") {
                    
                    beforeEach {
                        let kind = ValueKind.capitalAndRate(capital: 12343.23, rate: 123.67)
                        prepareSut(kind: kind)
                    }
                    
                    it("must render properly") {
                        expect(sut).to(matchSnapshot(named: "SimpleItemResultView_CapitalRate"))
                    }
                    
                }
                
                context("a date value") {
                    
                    beforeEach {
                        let date = Date(timeIntervalSince1970: 0)
                        let kind = ValueKind.date(value: date)
                        prepareSut(kind: kind)
                    }
                    
                    it("must render properly") {
                        expect(sut).to(matchSnapshot(named: "SimpleItemResultView_Date"))
                    }
                    
                }
                
                context("an integer value") {
                    
                    beforeEach {
                        let kind = ValueKind.integer(912837)
                        prepareSut(kind: kind)
                    }
                    
                    it("must render properly") {
                        expect(sut).to(matchSnapshot(named: "SimpleItemResultView_Integer"))
                    }
                    
                }
                
            }
            
        }
        
        func prepareSut(kind: ValueKind) {
            
            let frame = CGRect(x: 0, y: 0, width: 375, height: 30)
            sut = SingleItemResultView(frame: frame)
            
            let config = SingleItemResultView.Configuration(name: "Wide label for autolayout testing", value: kind)
            sut.setup(with: config)
            
        }
        
    }
    
}
