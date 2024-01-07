//
//  ProfileImage.swift
//  Instagram_Tutorial
//
//  Created by Bumgeun Song on 1/7/24.
//

import SwiftUI

extension Image {
    init(profileURL: String?) {
        if let profileURL {
            self = Image(profileURL)
        } else {
            self = Image(systemName: "person.circle.fill")
        }
    }
}
