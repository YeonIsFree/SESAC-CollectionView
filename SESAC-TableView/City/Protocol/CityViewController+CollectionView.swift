//
//  CityViewController+CollectionView.swift
//  SESAC-TableView
//
//  Created by Seryun Chun on 2024/01/11.
//

import UIKit

extension CityViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cityList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = cityCollectionView.dequeueReusableCell(withReuseIdentifier: CityCollectionViewCell.identifier, for: indexPath) as? CityCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let city = cityList[indexPath.item]
        cell.configureCell(data: city)
        
        return cell
    }
}
