//
//  CityViewController.swift
//  SESAC-TableView
//
//  Created by Seryun Chun on 2024/01/09.
//

import UIKit

class CityViewController: UIViewController {
    
    var cityList: [City] = CityInfo().city
    
    // MARK: - UI Properties
    
    @IBOutlet var cityCollectionView: UICollectionView!
    @IBOutlet var filterControl: UISegmentedControl!
    
    // MARK: - Life Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cityCollectionView.dataSource = self
        cityCollectionView.delegate = self
        
        let xib = UINib(nibName: CityCollectionViewCell.nibName, bundle: nil)
        cityCollectionView.register(xib, forCellWithReuseIdentifier: CityCollectionViewCell.identifier)
        
        configurationFlowLayout()
        
        filterControl.addTarget(self, action: #selector(filterControlValueChanged), for: .valueChanged)
    }
    
    // MARK: - Configure Methods
    
    @objc
    func filterControlValueChanged(_ sender: UISegmentedControl) {
        let index = sender.selectedSegmentIndex
        let rawData = CityInfo().city
        
        switch index {
        case 0:                                               // 모두
            cityList = rawData
        case 1:
            cityList = rawData.filter { $0.domestic_travel }  // 국내
        case 2:
            cityList = rawData.filter { !$0.domestic_travel } // 해외
        default:
            break
        }
        
        cityCollectionView.reloadData()
    }
    
    // MARK: - Layout Methods
    
    func configurationFlowLayout() {
        let layout = UICollectionViewFlowLayout()
        let spacing: CGFloat = 20
        let deviceWidth = UIScreen.main.bounds.width
        let cellWidth = (deviceWidth - spacing * 3) / 2
        
        layout.itemSize = CGSize(width: cellWidth, height: cellWidth * 1.5)
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        layout.scrollDirection = .vertical
        cityCollectionView.collectionViewLayout = layout
    }
}

 // MARK: - UICollectionView Delegate

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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        let sb = UIStoryboard(name: "CityTableView", bundle: nil)
        
        guard let vc = sb.instantiateViewController(withIdentifier: CityTableViewController.nibName) as? CityTableViewController else { return }
        
        navigationController?.pushViewController(vc, animated: true)
    }
}

