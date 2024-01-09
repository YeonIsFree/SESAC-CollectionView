//
//  CityViewController.swift
//  SESAC-TableView
//
//  Created by Seryun Chun on 2024/01/09.
//

import UIKit

class CityViewController: UIViewController {
    
    @IBOutlet var cityCollectionView: UICollectionView!
    @IBOutlet var filterControl: UISegmentedControl!

    var cityList: [City] = CityInfo().city
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cityCollectionView.dataSource = self
        cityCollectionView.delegate = self

        let xib = UINib(nibName: "CityCollectionViewCell", bundle: nil)
        cityCollectionView.register(xib, forCellWithReuseIdentifier: "CityCollectionViewCell")
        
        configurationFlowLayout()
        
        filterControl.addTarget(self, action: #selector(filterControlValueChanged), for: .valueChanged)
    }
    
    @objc
    func filterControlValueChanged(_ sender: UISegmentedControl) {
        let idx = sender.selectedSegmentIndex
        let rawData: [City] = CityInfo().city
        var tempCityList: [City] = []
        var targetType: Bool = false
        
        switch idx {
        case 0:                // 모두
            tempCityList = rawData
        case 1:
            targetType = true  // 국내
        case 2:
            targetType = false // 해외
        default:
            break
        }
        
        for city in rawData {
            // "모두" 일 경우 해당 for 문을 실행하지 않고 통과
            if idx == 0 { break }
            
            // 배열에서 targetType과 같은 애들만 임시 배열로 옮겨준다.
            if city.domestic_travel == targetType {
                tempCityList.append(city)
            }
        }
        
        // 이 함수에서 만든 임시 배열을 클래스 전체에서 쓰는 cityList로 복사
        cityList = tempCityList
        
        // 화면을 업데이트
        cityCollectionView.reloadData()
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
}

extension CityViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cityList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = cityCollectionView.dequeueReusableCell(withReuseIdentifier: "CityCollectionViewCell", for: indexPath) as! CityCollectionViewCell
        
        let city = cityList[indexPath.item]
        cell.configureCell(data: city)
        
        return cell
    }
}
