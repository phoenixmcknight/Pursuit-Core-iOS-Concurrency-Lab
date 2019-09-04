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
   
    @IBOutlet weak var populationID: UILabel!
    @IBOutlet weak var capitalID: UILabel!
    @IBOutlet weak var nameID: UILabel!
    
    var passingInfo1:CountryList!
    var passingInfo2:Rates!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLabels()
    }
    func setUpLabels() {
        populationID.text = passingInfo1.population.description
        capitalID.text = passingInfo1.capital
        nameID.text = passingInfo1.name
    }
}
