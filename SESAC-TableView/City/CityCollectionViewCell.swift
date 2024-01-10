//
//  CityCollectionViewCell.swift
//  SESAC-TableView
//
//  Created by Seryun Chun on 2024/01/09.
//

import UIKit
import Kingfisher

class CityCollectionViewCell: UICollectionViewCell {
    
     // MARK: - UI Properties
    
    @IBOutlet var cityImageView: UIImageView!
    @IBOutlet var cityTitleLabel: UILabel!
    @IBOutlet var citySubtitleLabel: UILabel!
    
    // MARK: - Configure Methods
    
    func configureCell(data: City) {
        // imageView Setting
        guard let url = URL(string: data.city_image) else { return }
        cityImageView.kf.setImage(with: url)
        cityImageView.contentMode = .scaleAspectFill
        
        // titleLabel Setting
        cityTitleLabel.text = data.city_name + " | " + data.city_english_name
        cityTitleLabel.font = .systemFont(ofSize: 15, weight: .bold)
        
        // citySubtitleLabel
        citySubtitleLabel.text = data.city_explain
        citySubtitleLabel.font = .systemFont(ofSize: 13, weight: .semibold)
        citySubtitleLabel.textColor = .gray
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let imageWidth = cityImageView.frame.width
        cityImageView.layer.cornerRadius = imageWidth / 2
    }
}
