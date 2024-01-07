//
//  String+Util.swift
//  Instagram_Tutorial
//
//  Created by Bumgeun Song on 1/7/24.
//

import Foundation

extension String {
    static let empty: String = ""
    
    var isEmpty: Bool {
        self == .empty
    }
    
    var isNotEmpty: Bool {
        self != .empty
    }
}

extension Optional where Wrapped == String {
    var orEmpty: String {
        if let self {
            return self
        } else {
            return .empty
        }
    }
}
