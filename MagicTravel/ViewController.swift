//
//  ViewController.swift
//  MagicTravel
//
//  Created by Victor Gomez on 5/05/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var countriesTableView: UITableView!
    
    var cities: [String] = ["Paris",
                               "Tokyo",
                               "New York",
                               "London",
                               "Sydney",
                               "Rio de Janeiro",
                               "Berlin",
                               "Beijing",
                               "Moscow",
                               "Cairo",]
    
    var citiesCountry: [String: String] = ["Paris":"France",
                                              "Tokyo":"Japan",
                                              "New York":"United States",
                                              "London":"United Kingdom",
                                              "Sydney":"Australia",
                                              "Rio de Janeiro":"Brazil",
                                              "Berlin":"Germany",
                                              "Beijing":"China",
                                              "Moscow":"Russia",
                                              "Cairo":"Egypt"]
    
    struct Constants {
        static let cellIdentifier = "MagicCountryCell"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        countriesTableView.register(UITableViewCell.self, forCellReuseIdentifier: Constants.cellIdentifier)
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for:
                                                        indexPath)
        var cellContentConfiguration = tableViewCell.defaultContentConfiguration()
        let cityName = cities[indexPath.row]
        cellContentConfiguration.text = cityName
        cellContentConfiguration.secondaryText = citiesCountry[cityName] ?? ""
        tableViewCell.contentConfiguration = cellContentConfiguration
        
        return tableViewCell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cityName = cities[indexPath.row]
        print("City: \(cityName) \nCountry: \(citiesCountry[cityName] ?? "")")
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

