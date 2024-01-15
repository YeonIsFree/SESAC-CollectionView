//
//  DetailTableViewCell.swift
//  SESAC-TableView
//
//  Created by Seryun Chun on 2024/01/11.
//

import UIKit
import Kingfisher

class CityTableViewCell: UITableViewCell {
    
     // MARK: - UI Properties
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var saveLabel: UILabel!
    @IBOutlet var likeImageView: UIImageView!
    @IBOutlet var cityImageView: UIImageView!
    @IBOutlet var stars: [UIImageView]!
    
     // MARK: - Configure Methods
    
    func configureCell(_ data: Travel) {
        
        // image
        let imageString = data.travel_image ?? ""
        guard let url = URL(string: imageString) else { return }
        cityImageView.kf.setImage(with: url)
        cityImageView.contentMode = .scaleAspectFill
        cityImageView.clipsToBounds = true
        cityImageView.layer.cornerRadius = 20
        
        // like
        let isLike = data.like ?? false
        let likeImage = isLike ? UIImage(systemName: "heart.fill") : UIImage(systemName: "heart")
        likeImageView.image = likeImage
        likeImageView.tintColor = .white

        // title
        titleLabel.text = data.title
        titleLabel.font = .boldSystemFont(ofSize: 16)
        
        // description
        let descriptionText = data.description ?? ""
        descriptionLabel.text = descriptionText
        descriptionLabel.textColor = .darkGray
        descriptionLabel.font = .systemFont(ofSize: 13)
        
        // save
        let saveNum = data.save ?? 0
        let number = NumberFormatter.convertedNumber(saveNum)
        saveLabel.text = number
        saveLabel.textColor = .lightGray
        
        // stars
        let gradeData = data.grade ?? 0
        let grade = Int(gradeData)
        for i in 0..<grade {
            stars[i].image = UIImage(systemName: "star.fill")
            stars[i].tintColor = .systemYellow
        }
    }
}
