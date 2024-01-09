//
//  TravelTableViewController.swift
//  SESAC-TableView
//
//  Created by Seryun Chun on 2024/01/08.
//

import UIKit
import Kingfisher

class TravelTableViewController: UITableViewController {
    
    let magazineList: [Magazine] = MagazineInfo().magazine

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return magazineList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TravelTableViewCell", for: indexPath) as! TravelTableViewCell
        
        cell.mainImageView.layer.cornerRadius = 20
        
        let magazine: Magazine = magazineList[indexPath.row]
        
        // imageView
        let url = URL(string: magazine.photo_image)!
        cell.mainImageView.kf.setImage(with: url)
        
        // title
        cell.titleLabel.text = magazine.title
        
        // subtitle
        cell.subtitleLabel.text = magazine.subtitle
        
        // dateLabel - dateformatter
        cell.dateLabel.text = DateFormatter.convertedDate(magazine.date)
        
        return cell
    }
}

extension DateFormatter {
    static func convertedDate(_ raw: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyMMdd"
        
        let convertedDate = dateFormatter.date(from: raw)
        
        dateFormatter.dateFormat = "yy년 MM월 dd일"
        
        return dateFormatter.string(from: convertedDate!)
    }
}
