//
//  UploadPostView.swift
//  Instagram_Tutorial
//
//  Created by Bumgeun Song on 1/6/24.
//

import SwiftUI

struct UploadPostView: View {
    @StateObject private var viewModel = UploadPostViewModel()
    @Binding var tabIndex: Int
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    self.viewModel.prompt = ""
                    self.tabIndex = TabIndex.feed
                }, label: {
                    Image(systemName: "xmark")
                }).tint(.black)
                
                Spacer()
                
                Text("New Post")
                    .fontWeight(.semibold)
                
                Spacer()
                
                Button(action: {}, label: {
                    Text("Next").fontWeight(.semibold)
                }).tint(.black)
                
            }.padding(.horizontal)
            
            TextField(
                "프롬프트를 입력하세요",
                text: $viewModel.prompt,
                axis: .vertical
            )
            .frame(minHeight: 200)
            .padding(.all)
            
            
            Spacer()
            
            VStack {
                Divider().padding(.all)
                Text("최근 프롬프트")
                    .fontWeight(.semibold)
                    .frame(
                        maxWidth: .infinity,
                        alignment: .leading
                    )
                    .padding(.horizontal)
                List(
                    viewModel.recentPrompts,
                    id: \.self,
                    selection: $prompt
                ) { prompt in
                    Text(prompt)
                }.listStyle(.plain)
            }
        }.task {
            await viewModel.loadRecentPrompts()
        }
    }
}

#Preview {
    UploadPostView(tabIndex: .constant(0))
}
