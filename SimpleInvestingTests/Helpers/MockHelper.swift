//
//  MockHelper.swift
//  SimpleInvestingTests
//
//  Created by Antonio Rodrigues on 20/04/19.
//  Copyright © 2019 Antonio Rodrigues. All rights reserved.
//

import Foundation
@testable import SimpleInvesting

class MockHelper {
    
    let jsonHelper = JsonHelper()
    
    func responseFor<T: Decodable>(decodableType: T.Type) -> T {
        
        switch decodableType {
            
        case is SimulationResponse.Type:
            
            let data = jsonHelper.dataFromFile("SimulationResponse",
                                               andContext: type(of: self))
            return jsonHelper.parse(dataType: decodableType,
                                    from: data)
            
        default:
            fatalError("Decodable not registered. Please add a json mock file")
            
        }
        
    }
    
}
