//
//  Brands.swift
//  BeoShop
//
//  Created by Akramul Haque on 8/5/19.
//  Copyright © 2019 AABPD. All rights reserved.
//

import UIKit

class Brands: UIViewController, UITableViewDataSource,UITableViewDelegate{
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    
    var carsDictionary = [String: [String]]()
    var carSectionTitles = [String]()
    var cars = ["Audi", "Aston Martin","BMW", "Bugatti", "Bentley","Chevrolet", "Cadillac","Dodge","Ferrari", "Ford","Honda","Jaguar","Lamborghini","Mercedes", "Mazda","Nissan","Porsche","Rolls Royce","Toyota","Volkswagen","Audi", "Aston Martin","BMW", "Bugatti", "Bentley","Chevrolet", "Cadillac","Dodge","Ferrari", "Ford","Honda","Jaguar","Lamborghini","Mercedes", "Mazda","Nissan","Porsche","Rolls Royce","Toyota","Volkswagen","Rashed"]
    
    var searchCars = [String]()
    
    var filteredData: [String]!
    var searching = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 1
        //        for car in cars {
        //            let carKey = String(car.prefix(1))
        //            if var carValues = carsDictionary[carKey] {
        //                carValues.append(car)
        //                carsDictionary[carKey] = carValues
        //            } else {
        //                carsDictionary[carKey] = [car]
        //            }
        //        }
        
        // 2
        //        carSectionTitles = [String](carsDictionary.keys)
        //        carSectionTitles = carSectionTitles.sorted(by: { $0 < $1 })
        
        //3
        
        tableView.dataSource = self
        tableView.delegate  = self
        searchBar.backgroundImage = UIImage()
        
    }
    //
    //    func numberOfSections(in tableView: UITableView) -> Int {
    //        // 1
    //        return carSectionTitles.count
    //    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 2
        if searching {
            return  searchCars.count
        } else {
            //            let carKey = carSectionTitles[section]
            //            if let carValues = carsDictionary[carKey] {
            //                return carValues.count
            return cars.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 3
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if searching {
            cell.textLabel?.text = searchCars[indexPath.row]
        } else {
            //            let carKey = carSectionTitles[indexPath.section]
            //            if let carValues = carsDictionary[carKey] {
            //                cell.textLabel?.text = carValues[indexPath.row]
            cell.textLabel?.text = cars[indexPath.row]
        }
        
        // Configure the cell...
        return cell
    }
    
    //    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    //        return carSectionTitles[section]
    //    }
    
    //    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
    //        return carSectionTitles
    //    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 35
    }
    
}

extension Brands : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchCars = cars.filter({$0.lowercased().prefix(searchText.count) == searchText.lowercased()})
        searching  = true
        tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        searchBar.text = ""
        tableView.reloadData()
    }
    
}

