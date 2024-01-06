//
//  UploadPostView.swift
//  Instagram_Tutorial
//
//  Created by Bumgeun Song on 1/6/24.
//

import SwiftUI

struct UploadPostView: View {
    @State private var prompt: String = ""
    
    var body: some View {
        HStack {
            Button(action: {}, label: {
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
            text: $prompt,
            axis: .vertical
        )
        .padding(.all)
        
        Spacer()
    }
}

#Preview {
    UploadPostView()
}
