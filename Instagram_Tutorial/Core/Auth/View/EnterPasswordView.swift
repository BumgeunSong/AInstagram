//
//  EnterPasswordView.swift
//  Instagram_Tutorial
//
//  Created by Bumgeun Song on 1/7/24.
//

import SwiftUI

struct EnterPasswordView: View {
    @State var password: String = ""
    
    var body: some View {
        Text("비밀번호를 입력해주세요")
            .font(.title)
            .fontWeight(.bold)
            .padding(.all)
            
        Text("보안을 위해 비밀번호는 8자리 이상이어야 해요.")
            .font(.subheadline)
            .padding(.all)
        
        TextField("비밀번호 입력", text: $password)
            .textInputAutocapitalization(.none)
            .font(.subheadline)
            .padding(12)
            .background(Color(uiColor: .systemGray6))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding(.horizontal, 24)
        
        Button(action: {
            print("Login")
        }, label: {
            Text("다음")
                .font(.subheadline)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, maxHeight: 44)
                .foregroundStyle(.white)
                .background(Color(uiColor: .systemBlue))
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .padding(.horizontal, 24)
        })
        .padding(.vertical)
    }
}

#Preview {
    EnterPasswordView()
}
