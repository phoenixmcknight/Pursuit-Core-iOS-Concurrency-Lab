//
//  ViewController.swift
//  Concurrency
//
//  Created by Phoenix McKnight on 9/3/19.
//  Copyright © 2019 Phoenix McKnight. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var searchBarOutlet: UISearchBar!
    
    @IBOutlet weak var mainTableView: UITableView!
    var countryList = [CountryList]() {
        didSet {
            DispatchQueue.main.async {
                
                self.mainTableView.reloadData()
            }
        }
    }
    var searchBarText: String? = nil {
        didSet {
            DispatchQueue.main.async {
                self.mainTableView.reloadData()
            }
        }
    }
    var searchResults: [CountryList] {
        get {
            guard let searchString = searchBarText else {
                return countryList
            }
            guard searchString != "" else {
                return countryList
            }
            return countryList.filter({$0.name.lowercased().replacingOccurrences(of: " ", with: "").contains(searchString.replacingOccurrences(of: " ", with: "").lowercased())})

        }
        
    }
    var exchangeRates = [Rates]() {
        didSet {
            DispatchQueue.main.async {
                self.mainTableView.reloadData()
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        getCountryListData()
        // Do any additional setup after loading the view.
    }
    private func getCountryListData() {
        CountryListAPIClient.shared.fetchData { (results) in
            switch results {
            case .success(let user):
                self.countryList = user
            case .failure(let failure):
                print("could not retrieve Data \(failure)")
            }
        }
    }
    
        }

extension ViewController: UITableViewDelegate{}
extension ViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return searchResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = mainTableView.dequeueReusableCell(withIdentifier: "ID") as! TableViewCell
        cell.nameID.text = searchResults[indexPath.row].name
        cell.populationID.text = searchResults[indexPath.row].population.description
       cell.capitalCityID.text = searchResults[indexPath.row].capital
//        if let imageURL = URL(string: countryList[indexPath.row].flag.description){
//            DispatchQueue.global().async {
//                let data = try? Data(contentsOf: imageURL)
//                if let imageData = data{
//                    let image = UIImage(data: imageData)
//                    DispatchQueue.main.async {
//                        cell.imageViewID.image = image
//    }
//                }
//            }
        return cell

    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        
        storyBoard.passingInfo1 = searchResults[indexPath.row]
       
       
        navigationController?.pushViewController(storyBoard, animated: true)
        
    }
    func setUp() {
        mainTableView.dataSource = self
        mainTableView.delegate = self
        searchBarOutlet.delegate = self
    }
}
extension ViewController:UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchBarText = searchBar.text
    }
}



