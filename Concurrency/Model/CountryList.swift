//
//  CountryList.swift
//  Concurrency
//
//  Created by Phoenix McKnight on 9/3/19.
//  Copyright © 2019 Phoenix McKnight. All rights reserved.
//

import Foundation
import UIKit

struct  CountryList:Codable {
    let name:String
    let capital:String
    let population:Int
    let flag:URL
    let currencies:[Currencies]
    let region:String
    func getFlag(url:URL) {

    }
}
struct Currencies:Codable {
    let code:String
    let name:String
    let symbol:String
}
