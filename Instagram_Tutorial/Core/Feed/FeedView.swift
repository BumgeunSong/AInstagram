//
//  FeedView.swift
//  Instagram_Tutorial
//
//  Created by Bumgeun Song on 12/31/23.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 32) {
                    ForEach(1...10, id: \.self) { count in
                        FeedCell()
                    }
                }
            }
            .navigationTitle("Feed")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(content: {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Image(.instagramTypoLogo)
                            .resizable()
                            .tint(.black)
                            .frame(width: 84, height: 48)
                    })
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Image(systemName: "paperplane")
                            .imageScale(.large)
                            .tint(.black)
                            .fontWeight(.semibold)
                    })
                }
            })
        }
        
    }
}

#Preview {
    FeedView()
}
