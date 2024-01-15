//
//  Identiable+.swift
//  SESAC-TableView
//
//  Created by Seryun Chun on 2024/01/11.
//

import UIKit

protocol Identiable {
    static var identifier: String { get }
}

extension Identiable {
    static var identifier: String {
        return String(describing: Self.self)
    }
}

extension NSObject: Identiable {}
