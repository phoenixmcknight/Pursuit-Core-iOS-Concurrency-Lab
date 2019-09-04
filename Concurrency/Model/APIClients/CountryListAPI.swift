//
//  CountryListAPI.swift
//  Concurrency
//
//  Created by Phoenix McKnight on 9/3/19.
//  Copyright © 2019 Phoenix McKnight. All rights reserved.
//

import Foundation
import UIKit

struct CountryListAPIClient {
    static var shared = CountryListAPIClient()
    let countryURL =
      "https://restcountries.eu/rest/v2/name/united"
    func fetchData(completionHandler:@escaping (Result<[CountryList],errorHandler>) -> ()) {
        guard let url = URL(string: countryURL) else {completionHandler(.failure(.badURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if error != nil {
                completionHandler(.failure(.noDataAvailable))
                return
            }
            guard let retrieveData = data else {
                completionHandler(.failure(.couldNotProcessData))
                return
            }
            do {
            let countryList = try JSONDecoder().decode([CountryList].self, from: retrieveData)
            
            completionHandler(.success(countryList))
            
            }catch {
            completionHandler(.failure(.noDataAvailable))
            }
            }  .resume()
        
    }
}


