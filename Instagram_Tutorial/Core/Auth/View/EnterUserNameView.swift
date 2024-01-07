//
//  EnterUserNameView.swift
//  Instagram_Tutorial
//
//  Created by Bumgeun Song on 1/7/24.
//

import SwiftUI

struct EnterUserNameView: View {
    
    @State var userName: String = ""
    
    var body: some View {
        Text("사용자 이름을 입력해주세요")
            .font(.title)
            .fontWeight(.bold)
            .padding(.all)
            
        Text("다른 유저들에게 표시되는 이름이에요. 나중에 얼마든지 바꿀 수 있어요.")
            .font(.subheadline)
            .padding(.all)
        
        TextField("사용자 이름 입력", text: $userName)
            .textInputAutocapitalization(.none)
            .font(.subheadline)
            .padding(12)
            .background(Color(uiColor: .systemGray6))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding(.horizontal, 24)
        
        Button(action: {
            print("다음")
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
    EnterUserNameView()
}
