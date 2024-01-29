//
//  FeedView.swift
//  Instagram_Tutorial
//
//  Created by Bumgeun Song on 12/31/23.
//

import SwiftUI

struct FeedView: View {
    
    @StateObject var viewModel = FeedViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 32) {
                    ForEach(viewModel.posts) { post in
                        FeedCell(post: post)
                    }
                }
                
            }
            .refreshable {
                Task { await viewModel.loadPosts() }
            }
            .navigationTitle("피드")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(content: {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Image(.ainstagramLogo)
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
