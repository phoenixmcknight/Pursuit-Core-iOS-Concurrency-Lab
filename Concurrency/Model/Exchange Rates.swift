//
//  Exchange Rates.swift
//  Concurrency
//
//  Created by Phoenix McKnight on 9/3/19.
//  Copyright © 2019 Phoenix McKnight. All rights reserved.
//

import Foundation
import UIKit

struct ExchangeRates:Codable {
  let rates:[Rates]
    }
    
struct Rates:Codable {
    let USD:Double
    let TZS:Double
    let AED:Double
    let GBP:Double
    let MXN:Double
    
}
