//
//  FeedCell.swift
//  Instagram_Tutorial
//
//  Created by Bumgeun Song on 12/31/23.
//

import SwiftUI

struct FeedCell: View {
    var body: some View {
        // Profile Pic + Username
        VStack {
            HStack {
                Image(.eddyDesc)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 48, height: 48)
                    .clipShape(Circle())
                
                Text("bumgeun.song")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                
                Spacer()
            }.padding(.horizontal)
            
            
            // Post Image
            Image(.london)
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
            Text("1 likes")
                .font(.footnote)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)  // 왼쪽 정렬로 붙이고 싶을 때
                .padding(.horizontal)
                .padding(.vertical, 1)
            
            // Post Caption
            HStack {
                Text("bumgeun.song ")
                    .fontWeight(.semibold) +
                Text("This is London 🏴󠁧󠁢󠁥󠁮󠁧󠁿 It was real fun experience! ")
            }
            .font(.footnote)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            
            // time
            Text("5h ago")
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
    FeedCell()
}
