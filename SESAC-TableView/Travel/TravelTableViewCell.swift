//
//  TravelTableViewCell.swift
//  SESAC-TableView
//
//  Created by Seryun Chun on 2024/01/08.
//

import UIKit

class TravelTableViewCell: UITableViewCell {

    @IBOutlet var mainImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subtitleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    func configureTravelTableViewCell(_ data: Magazine) {
        // imageView
        let url = URL(string: data.photo_image)
        mainImageView.kf.setImage(with: url)
        mainImageView.clipsToBounds = true
        mainImageView.layer.cornerRadius = 20
        
        // title
        titleLabel.text = data.title
        
        // subtitle
        subtitleLabel.text = data.subtitle
        
        // date
        dateLabel.text = DateFormatter.convertedDate(data.date)
    }
    
}
