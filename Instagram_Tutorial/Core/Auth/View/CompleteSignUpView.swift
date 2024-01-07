//
//  CompleteSignUpView.swift
//  Instagram_Tutorial
//
//  Created by Bumgeun Song on 1/7/24.
//

import SwiftUI

struct CompleteSignUpView: View {
    
    let userName: String
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Text("환영합니다, \(userName)님!")
            .font(.title)
            .fontWeight(.bold)
            .padding(.all)
            
        Text("아래 버튼을 누르고 에인스타그램(AInstagram)을 이용해보세요")
            .font(.subheadline)
            .padding(.all)
        
        Button(action: {
            dismiss()
        }, label: {
            Text("시작하기")
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
    CompleteSignUpView(userName: "에디쏭")
}
