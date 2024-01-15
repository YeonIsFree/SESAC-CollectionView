//
//  TravelTableViewController.swift
//  SESAC-TableView
//
//  Created by Seryun Chun on 2024/01/08.
//

import UIKit
import Kingfisher

class TravelTableViewController: UIViewController {
    
    let magazineList: [Magazine] = MagazineInfo.magazine
    
    // MARK: - Life Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - UITableViewDelegate

extension TravelTableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return magazineList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TravelTableViewCell.identifier, for: indexPath) as? TravelTableViewCell else {
            return UITableViewCell()
        }
        
        cell.configureTravelTableViewCell(magazineList[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(identifier: TravelDetailViewController.identifier) as? TravelDetailViewController else { return }
        
        vc.urlString = magazineList[indexPath.row].link
        
        navigationController?.pushViewController(vc, animated: true)
    }
}

