//
//  FeedCell.swift
//  Instagram_Tutorial
//
//  Created by Bumgeun Song on 12/31/23.
//

import SwiftUI

struct FeedCell: View {
    
    let post: Post
    
    var body: some View {
        // Profile Pic + Username
        VStack {
            HStack {
                CircularProfileImageView(user: post.creator, size: 48)
                
                Text(post.creator.userName)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                
                Spacer()
            }.padding(.horizontal)
            
            
            // Post Image
            Image(post.imageURL)
                .resizable().scaledToFill()
                .frame(height: 400)
                .clipShape(Rectangle())
            
            // Action row
            HStack {
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: "heart")
                        .imageScale(.large)
                }).tint(.black)
                Button(action: {}, label: {
                    Image(systemName: "bubble.right")
                        .imageScale(.large)
                }).tint(.black)
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: "paperplane")
                        .imageScale(.large)
                }).tint(.black)
                
                Spacer()
            }.padding(.horizontal).padding(.top, 4)
            
            // likes
            Text("\(post.likes) likes")
                .font(.footnote)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)  // 왼쪽 정렬로 붙이고 싶을 때
                .padding(.horizontal)
                .padding(.vertical, 1)
            
            // Post Caption
            HStack {
                Text("\(post.creator.userName) ")
                    .fontWeight(.semibold) +
                Text(post.caption)
            }
            .font(.footnote)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            
            // time
            Text(post.relativeDate)
                .font(.footnote)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)  // 왼쪽 정렬로 붙이고 싶을 때
                .padding(.horizontal)
                .padding(.vertical, 1)
                .foregroundStyle(Color(.darkGray))
        }
    }
}

#Preview {
    FeedCell(post: .mock[0])
}
