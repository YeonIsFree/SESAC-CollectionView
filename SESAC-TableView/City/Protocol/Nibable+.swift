//
//  Niable+.swift
//  SESAC-TableView
//
//  Created by Seryun Chun on 2024/01/11.
//

import UIKit

protocol Nibable {
    static var nibName: String { get }  // 채택 하고 구현해!
}

extension Nibable {
    static var nibName: String {
        return String(describing: Self.self)    // 채택만 해!  (자동으로) 구현
    }
}

extension UIView: Nibable {}
