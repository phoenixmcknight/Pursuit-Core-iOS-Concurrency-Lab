//
//  ExchangeRateAPi.swift
//  Concurrency
//
//  Created by Phoenix McKnight on 9/3/19.
//  Copyright © 2019 Phoenix McKnight. All rights reserved.
//

import Foundation
import UIKit

struct CurrencyAPIClient {
    static var shared = CurrencyAPIClient()
    let currencyURL =
    "http://data.fixer.io/api/latest?access_key=a17aef5ece92cf36d9c5963f7f4babf1&format=1"
    
    func fetchCurrencyData(completionHandler:@escaping (Result<ExchangeRates,errorHandler>) -> ()) {
        guard let url = URL(string: currencyURL) else {completionHandler(.failure(.badURL))
            return
        }
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if error != nil {
                completionHandler(.failure(.couldNotProcessData))
                return
            }
            guard let retrieveData = data else {
                completionHandler(.failure(.couldNotProcessData))
                return
            }
            do {
                let exchangeRates = try JSONDecoder().decode(ExchangeRates.self, from: retrieveData)
                
                completionHandler(.success(exchangeRates))
                
            }catch {
                completionHandler(.failure(.noDataAvailable))
            }
            }  .resume()
    }
}


