//
//  DetailViewController.swift
//  SESAC-TableView
//
//  Created by Seryun Chun on 2024/01/11.
//

import UIKit

class CityTableViewController: UIViewController {
    
    var travelList = TravelInfo().travel
    
    // MARK: - UI Properties
    
    @IBOutlet var cityTableView: UITableView!
    
    // MARK: - Life Cycle Mothods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Delegate
        cityTableView.dataSource = self
        cityTableView.delegate = self
        
        // Xib
        let cityXib = UINib(nibName: CityTableViewCell.nibName, bundle: nil)
        cityTableView.register(cityXib, forCellReuseIdentifier: CityTableViewCell.nibName)
        
        let adXib = UINib(nibName: ADTableViewCell.nibName, bundle: nil)
        cityTableView.register(adXib, forCellReuseIdentifier: ADTableViewCell.nibName)
    }
}

// MARK: - UITableView Delegate

extension CityTableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        travelList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let travel = travelList[indexPath.row]
        
        if travel.ad {
            
            guard let cell = cityTableView.dequeueReusableCell(withIdentifier: ADTableViewCell.identifier, for: indexPath) as? ADTableViewCell else { return UITableViewCell() }
            
            cell.backgroundColor = .gray
            
            cell.configureADCell(travel)
            
            return cell
            
        } else {
            
            guard let cell = cityTableView.dequeueReusableCell(withIdentifier: CityTableViewCell.identifier, for: indexPath) as? CityTableViewCell else { return UITableViewCell() }
            
            cell.configureCell(travel)
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if travelList[indexPath.row].ad {
            guard let vc = storyboard?.instantiateViewController(withIdentifier: AdViewController.identifier) as? AdViewController else { return }
            
            present(vc, animated: true)
            
        } else {
            guard let vc = storyboard?.instantiateViewController(withIdentifier: DetailViewController.identifier) as? DetailViewController else { return }
            
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
