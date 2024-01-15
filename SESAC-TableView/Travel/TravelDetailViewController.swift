//
//  TravelDetailViewController.swift
//  SESAC-TableView
//
//  Created by Seryun Chun on 2024/01/15.
//

import UIKit
import WebKit

class TravelDetailViewController: UIViewController {
    
    var urlString: String = ""
    
    @IBOutlet var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureWebView()
    }
    
    func configureWebView() {
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
}
