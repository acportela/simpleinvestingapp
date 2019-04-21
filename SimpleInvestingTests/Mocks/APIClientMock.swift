//
//  APIClientMock.swift
//  SimpleInvestingTests
//
//  Created by Antonio Rodrigues on 20/04/19.
//  Copyright © 2019 Antonio Rodrigues. All rights reserved.
//

import Foundation
@testable import SimpleInvesting

class APIClientMock: APIClient {
    
    var baseURL = "https://api-simulator-calc.easynvest.com.br/calculator/simulate"
    
    func requestDecodadle<T: Decodable>(url: URL, callback: @escaping (Result<T>) -> Void) {
        let response = MockHelper().responseFor(decodableType: T.self)
        callback(.success(response))
    }
    
}
