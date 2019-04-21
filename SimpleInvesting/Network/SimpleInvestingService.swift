//
//  SimpleInvestingService.swift
//  SimpleInvesting
//
//  Created by Antonio Rodrigues on 20/04/19.
//  Copyright © 2019 Antonio Rodrigues. All rights reserved.
//

import Foundation

typealias SimulationResultType = Result<SimulationResponse>

protocol SimpleInvestingServiceProtocol: class {
    func simulateInvestiment(input: SimulationInput, callback: @escaping (SimulationResultType) -> Void )
}

final class SimpleInvestingService: SimpleInvestingServiceProtocol {
    
    let client: APIClient
    
    init(client: APIClient = SimpleInvestingAPIClient.sharedClient) {
        self.client = client
    }
    
    public func simulateInvestiment(input: SimulationInput, callback: @escaping (SimulationResultType) -> Void ) {
        
        let queries: [String: String] = ["investedAmount": input.investedAmount,
                                         "index": input.index,
                                         "rate": input.rate,
                                         "isTaxFree": input.isTaxFree,
                                         "maturityDate": input.maturityDate]
        
        guard let url = buildURL(withQueries: queries) else {
            callback(.error(.malformedURL))
            return
        }
        
        client.requestDecodadle(url: url, callback: callback)
        
    }
    
}

extension SimpleInvestingService {
    
    func flattened(queries: [String: String]) -> String {
        var flattened = "?"
        queries.forEach {
            let field = "\($0.key)=\($0.value)&"
            flattened += field
        }
        flattened.removeLast()
        return flattened
    }
    
    func buildURL(withQueries queries: [String: String]) -> URL? {
        let urlString = client.baseURL + flattened(queries: queries)
        return URL(string: urlString)
    }
    
}
