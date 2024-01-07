//
//  SignUpView.swift
//  Instagram_Tutorial
//
//  Created by Bumgeun Song on 1/3/24.
//

import SwiftUI

struct EnterEmailView: View {
    @State var email: String = ""
    
    var body: some View {
        Text("이메일을 입력해주세요")
            .font(.title)
            .fontWeight(.bold)
            .padding(.all)
            
        Text("앞으로 로그인할 때 사용하게 될 거예요.")
            .font(.subheadline)
            .padding(.all)
        
        TextField("이메일 입력", text: $email)
            .textInputAutocapitalization(.none)
            .font(.subheadline)
            .padding(12)
            .background(Color(uiColor: .systemGray6))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding(.horizontal, 24)
        
        
        NavigationLink {
            EnterPasswordView()
        } label: {
            Text("다음")
                .font(.subheadline)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, maxHeight: 44)
                .foregroundStyle(.white)
                .background(Color(uiColor: .systemBlue))
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .padding(.horizontal, 24)
        }.padding(.vertical)
        
        Spacer()
    }
}

#Preview {
    EnterEmailView()
}
