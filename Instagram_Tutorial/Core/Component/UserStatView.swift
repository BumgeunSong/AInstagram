//
//  UserStatView.swift
//  Instagram_Tutorial
//
//  Created by Bumgeun Song on 12/30/23.
//

import SwiftUI

struct UserStatView: View {
    let title: String
    let value: Int
    
    var body: some View {
        VStack {
            Text("\(value)")
                .font(.headline)
                .fontWeight(.semibold)
            Text(title)
                .font(.footnote)
        }
        .frame(width: 80)
    }
}

#Preview {
    UserStatView(title: "Posts", value: 4)
}
