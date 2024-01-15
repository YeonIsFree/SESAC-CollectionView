//
//  DateFormatter.swift
//  SESAC-TableView
//
//  Created by Seryun Chun on 2024/01/15.
//

import Foundation

extension DateFormatter {
    static func convertedDate(_ raw: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyMMdd"
        
        let convertedDate = dateFormatter.date(from: raw)
        
        dateFormatter.dateFormat = "yy년 MM월 dd일"
        
        return dateFormatter.string(from: convertedDate!)
    }
}
