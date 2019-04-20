//
//  MainButtonViewSpec.swift
//  SimpleInvestingTests
//
//  Created by Antonio Rodrigues on 20/04/19.
//  Copyright © 2019 Antonio Rodrigues. All rights reserved.
//

import Quick
import Nimble
import Nimble_Snapshots

@testable import SimpleInvesting

class MainButtonViewSpec: QuickSpec {
    
    override func spec() {
        
        var sut: MainButtonView!
        
        describe("MainButtonView") {
            
            context("when presenting on screen") {
                
                context("with a normal state") {
                    
                    beforeEach {
                        let frame = CGRect(x: 0, y: 0, width: 320, height: 50)
                        sut = MainButtonView(frame: frame)
                        sut.setTitle("Simular", for: .normal)
                    }
                    
                    it("must render properly") {
                        expect(sut).to(matchSnapshot(named: "MainButtonView_Normal"))
                    }
                    
                }
                
                context("with a disabled state") {
                    
                    beforeEach {
                        let frame = CGRect(x: 0, y: 0, width: 320, height: 50)
                        sut = MainButtonView(frame: frame)
                        sut.setTitle("Simular", for: .normal)
                        sut.isEnabled = false
                    }
                    
                    it("must render properly") {
                        expect(sut).to(matchSnapshot(named: "MainButtonView_Disabled"))
                    }
                    
                }
                
                context("with a highlighted state") {
                    
                    beforeEach {
                        let frame = CGRect(x: 0, y: 0, width: 320, height: 50)
                        sut = MainButtonView(frame: frame)
                        sut.setTitle("Simular", for: .normal)
                        sut.isHighlighted = true
                    }
                    
                    it("must render properly") {
                        expect(sut).to(matchSnapshot(named: "MainButtonView_Highlighted"))
                    }
                    
                }
                
                context("with a loading state") {
                    
                    beforeEach {
                        let frame = CGRect(x: 0, y: 0, width: 320, height: 50)
                        sut = MainButtonView(frame: frame)
                        sut.setTitle("Simular", for: .normal)
                        sut.startLoading()
                    }
                    
                    it("must render properly") {
                        expect(sut).to(matchSnapshot(named: "MainButtonView_Loading"))
                    }
                    
                }
                
            }
            
        }
        
    }
    
}
