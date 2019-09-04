//
//  DetailViewController.swift
//  Concurrency
//
//  Created by Phoenix McKnight on 9/3/19.
//  Copyright © 2019 Phoenix McKnight. All rights reserved.
//

import Foundation
import UIKit

class DetailViewController:UIViewController {
   
    @IBOutlet weak var exchangeRateLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var populationID: UILabel!
    @IBOutlet weak var capitalID: UILabel!
    @IBOutlet weak var nameID: UILabel!
    
    var passingInfo1:CountryList!
    var exchangeRates = [Rates]() {
        didSet {
            DispatchQueue.main.async {

            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLabels()
    }
    private func getCurrencyData() {
        CurrencyAPIClient.shared.fetchCurrencyData { (results) in
            switch results {
            case .success(let user):
                self.exchangeRates = user.rates
            case .failure(let failure):
                print("could not retrieve Data \(failure)")
            }
        }
    }
    func setUpLabels() {
        populationID.text = passingInfo1.population.description
        capitalID.text = passingInfo1.capital
        nameID.text = passingInfo1.name
    }
    func setUpCurrencyLabel() {
        
    }
}
