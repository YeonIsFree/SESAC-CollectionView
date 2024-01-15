//
//  NumberFormatter.swift
//  SESAC-TableView
//
//  Created by Seryun Chun on 2024/01/15.
//

import Foundation

extension NumberFormatter {
    static func convertedNumber(_ raw: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        let convertedNumber = numberFormatter.string(for: raw) ?? ""
        
        return convertedNumber
    }
}
