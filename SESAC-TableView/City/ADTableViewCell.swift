//
//  ADTableViewCell.swift
//  SESAC-TableView
//
//  Created by Seryun Chun on 2024/01/11.
//

import UIKit

class ADTableViewCell: UITableViewCell {
    
    @IBOutlet var ADLabel: UILabel!
    @IBOutlet var ADMainLabel: UILabel!
    
    func configureADCell(_ data: Travel) {
        ADLabel.font = .systemFont(ofSize: 12, weight: .bold)
        ADLabel.clipsToBounds = true
        ADLabel.layer.cornerRadius = 5
        ADLabel.backgroundColor = .white
        
        ADMainLabel.text = data.title
        ADMainLabel.textColor = .white
        ADMainLabel.font = .systemFont(ofSize: 18, weight: .bold)
    }
}
