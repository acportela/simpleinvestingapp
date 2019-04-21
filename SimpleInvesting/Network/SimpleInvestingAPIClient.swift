//
//  SimpleInvestingAPIClient.swift
//  SimpleInvesting
//
//  Created by Antonio Rodrigues on 20/04/19.
//  Copyright © 2019 Antonio Rodrigues. All rights reserved.
//

import Foundation
import Alamofire

protocol APIClient: class {
    var baseURL: String { get }
    func requestDecodadle<T: Decodable>(url: URL, callback: @escaping (Result<T>) -> Void)
}

class SimpleInvestingAPIClient: SessionManager, APIClient {
    
    var baseURL = "https://api-simulator-calc.easynvest.com.br/calculator/simulate"
    
    private init() {
        super.init()
    }
    
    static let sharedClient = SimpleInvestingAPIClient()
    
    func requestDecodadle<T: Decodable>(url: URL, callback: @escaping (Result<T>) -> Void) {
        self.request(url: url) { resp in
            switch resp {
            case .success(let data):
                
                do {
                    let object = try JSONDecoder().decode(T.self, from: data)
                    callback(.success(object))
                } catch {
                    callback(.error(.parsing))
                }
                
            case .error(let error):
                callback(.error(error))
            }
        }
    }
    
    private func request(url: URL, callback: @escaping (Result<Data>) -> Void) {
        
        let request = URLRequest(url: url)
        
        guard let rechability = NetworkReachabilityManager(), rechability.isReachable else {
            callback(.error(.connectivity))
            return
        }
        
        self.request(request).validate(statusCode: 200..<300).responseData { dataResponse in
            
            guard dataResponse.result.error == nil else {
                callback(.error(.unknown))
                return
            }
            
            guard let data = dataResponse.data else {
                callback(.error(.unknown))
                return
            }
            
            callback(.success(data))
            
        }
    }
}
