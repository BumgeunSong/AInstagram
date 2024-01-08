//
//  ProfileEditView.swift
//  Instagram_Tutorial
//
//  Created by Bumgeun Song on 1/8/24.
//

import SwiftUI

struct ProfileEditView: View {
    @State var username: String = ""
    @State var fullname: String = ""
    @State var bio: String = ""
    
    var body: some View {
        
        VStack {
            // 프로필 이미지
            
            // 풀네임
            TextField(text: $username, prompt: Text("Full Name")) {
                Text("Full name")
            }
            // 사용자 이름
            TextField(text: $fullname, prompt: Text("User name")) {
                Text("User name")
            }
            
            // Bio
            TextField(text: $bio, prompt: Text("Bio")) {
                Text("bio")
            }
        }.padding(.horizontal)
        
        // 수정하기 CTA
        NavigationLink {
            //
        } label: {
            Text("확인")
                .font(.subheadline)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, maxHeight: 44)
                .foregroundStyle(.white)
                .background(Color(uiColor: .systemBlue))
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .padding(.horizontal, 24)
        }.padding(.vertical)
    }
}

#Preview {
    ProfileEditView()
}
