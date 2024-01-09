//
//  CityCollectionViewCell.swift
//  SESAC-TableView
//
//  Created by Seryun Chun on 2024/01/09.
//

import UIKit
import Kingfisher

class CityCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var cityImageView: UIImageView!
    @IBOutlet var cityTitleLabel: UILabel!
    @IBOutlet var citySubtitleLabel: UILabel!
    
    func configureCell(data: City) {
        // imageView Setting
        guard let url = URL(string: data.city_image) else { return }
        cityImageView.kf.setImage(with: url)
        cityImageView.contentMode = .scaleAspectFill
        cityTitleLabel.font = .systemFont(ofSize: 15, weight: .bold)
        citySubtitleLabel.font = .systemFont(ofSize: 13, weight: .semibold)
        citySubtitleLabel.textColor = .gray

        // titleLabel Setting
        cityTitleLabel.text = data.city_name + " | " + data.city_english_name
        
        // citySubtitleLabel
        citySubtitleLabel.text = data.city_explain
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let radius = cityImageView.frame.width
        cityImageView.layer.cornerRadius = radius / 2
    }
}
