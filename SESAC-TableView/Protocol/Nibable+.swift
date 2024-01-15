//
//  Niable+.swift
//  SESAC-TableView
//
//  Created by Seryun Chun on 2024/01/11.
//

import UIKit

protocol Nibable {
    static var nibName: String { get }
}

extension Nibable {
    static var nibName: String {
        return String(describing: Self.self)
    }
}

extension NSObject: Nibable {}
