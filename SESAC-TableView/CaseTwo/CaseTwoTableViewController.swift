//
//  CaseOneTableViewController.swift
//  SESAC-TableView
//
//  Created by Seryun Chun on 2024/01/05.
//

import UIKit

class CaseTwoTableViewController: UITableViewController {
    
    @IBOutlet var headerTitle: UILabel!
    
    let configList: [[String]] = [
        ["공지사항", "실험실", "버전 정보"],
        ["개인/보안", "알림", "채팅", "멀티프로필"],
        ["고객센터/도움말"]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return configList.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return configList[section].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CaseTwoTableViewCell", for: indexPath)
        
        cell.textLabel?.text = configList[indexPath.section][indexPath.row]
        cell.textLabel?.font = .systemFont(ofSize: 14)
        cell.textLabel?.textColor = .gray
        cell.backgroundColor = .black
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "전체 설정"
        case 1:
            return "개인 설정"
        case 2:
            return "기타"
        default:
            return ""
        }
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let headerView = view as! UITableViewHeaderFooterView
        headerView.textLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        headerView.textLabel?.textColor = .gray
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
}
