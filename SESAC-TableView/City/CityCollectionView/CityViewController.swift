//
//  CityViewController.swift
//  SESAC-TableView
//
//  Created by Seryun Chun on 2024/01/09.
//

import UIKit

enum SegementedCity: Int, CaseIterable {
    case all
    case domestic
    case abroad
    
    var segmentedCityList: [City] {
        switch self {
        case .all:
            return CityInfo.city
        case .domestic:
            return CityInfo.city.filter { $0.domestic_travel }
        case .abroad:
            return CityInfo.city.filter { !$0.domestic_travel }
        }
    }
}

enum StoryboardInfo {
    static let cityTableViewName = "CityTableView"
}

class CityViewController: UIViewController {
    var cityList: [City] = CityInfo.city
    var appliedCityList: [City] = CityInfo.city {
        didSet {
            cityCollectionView.reloadData()
        }
    }
    
    // MARK: - UI Properties
    
    @IBOutlet var cityCollectionView: UICollectionView!
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var filterControl: UISegmentedControl!
    
    // MARK: - Life Cycle Method
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureCollectionView()
        configurationFlowLayout()
        configureSearchBar()
        
        filterControl.addTarget(self, action: #selector(filterControlValueChanged), for: .valueChanged)
    }
    
    // MARK: - Configure SegmentControl
    
    @objc
    func filterControlValueChanged(_ sender: UISegmentedControl) {
        cityList = SegementedCity(rawValue: sender.selectedSegmentIndex)?.segmentedCityList ?? []
        appliedCityList = cityList
    }
}

// MARK: - UISearchBar Delegate

extension CityViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let list = cityList.filter { isContain(searchText.lowercased(), $0) }
        appliedCityList = list
    }
    
    func isContain(_ target: String, _ data: City) -> Bool {
        return target == data.city_name || target == data.city_english_name.lowercased() || data.city_explain.contains(target)
    }
    
    func configureSearchBar() {
        searchBar.delegate = self
    }
}

// MARK: - UICollectionView Delegate

extension CityViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return appliedCityList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = cityCollectionView.dequeueReusableCell(withReuseIdentifier: CityCollectionViewCell.identifier, for: indexPath) as? CityCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.configureCell(appliedCityList[indexPath.item])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: StoryboardInfo.cityTableViewName, bundle: nil)
        
        guard let vc = sb.instantiateViewController(withIdentifier: CityTableViewController.nibName) as? CityTableViewController else {
            fatalError("Can not found nibName")
        }
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
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
    
    func configureCollectionView() {
        // delegate
        cityCollectionView.dataSource = self
        cityCollectionView.delegate = self
        
        // xib
        let xib = UINib(nibName: CityCollectionViewCell.nibName, bundle: nil)
        cityCollectionView.register(xib, forCellWithReuseIdentifier: CityCollectionViewCell.identifier)
    }
}


