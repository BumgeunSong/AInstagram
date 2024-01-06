//
//  UploadPostView.swift
//  Instagram_Tutorial
//
//  Created by Bumgeun Song on 1/6/24.
//

import SwiftUI

struct UploadPostView: View {
    
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
    }
}

#Preview {
    UploadPostView()
}
