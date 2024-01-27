//
//  UploadPostView.swift
//  Instagram_Tutorial
//
//  Created by Bumgeun Song on 1/6/24.
//

import SwiftUI
import Kingfisher

struct UploadPostView: View {
    @StateObject private var viewModel = UploadPostViewModel()
    @Binding var tabIndex: Int
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    self.viewModel.reset()
                    self.tabIndex = TabIndex.feed
                }, label: {
                    Image(systemName: "xmark")
                })
                
                Spacer()
                
                Text("새 포스트")
                    .fontWeight(.semibold)
                
                Spacer()
                
                Button(action: {
                    Task {
                        await viewModel.loadImage()
                        self.tabIndex = TabIndex.feed
                    }
                }, label: {
                    Text("업로드").fontWeight(.semibold)
                })
                
            }
            .tint(.accentColor)
            .padding(.horizontal)
            .allowsHitTesting(!viewModel.isLoading)
            
            ZStack {
                if viewModel.isLoading {
                    ProgressView("이미지 생성 중...")
                        .progressViewStyle(.circular)
                        .tint(.accentColor)
                }
                
                VStack {
                    TextField(
                        "프롬프트를 입력하세요",
                        text: $viewModel.currentPrompt,
                        axis: .vertical
                    )
                    .frame(minHeight: 200)
                    .padding(.all)
                    
                    Spacer()
                    
                    if let usageLeftToday = viewModel.usageLeftToday {
                        if usageLeftToday <= 0 {
                            Text("포스트는 하루에 3번까지 업로드 가능해요.")
                                .font(.footnote)
                                .tint(.gray)
                        } else {
                            Text("오늘 남은 업로드 \(usageLeftToday)/3")
                                .font(.footnote)
                                .tint(.gray)
                        }
                    }
                }
                .allowsHitTesting(!viewModel.isLoading)
            }
            VStack {
                Button(action: {
                    viewModel.showingRecommendedPrompts = true
                }, label: {
                    Text("추천 프롬프트")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .frame(
                            maxWidth: .infinity,
                            alignment: .leading
                        )
                        .padding(.horizontal)
                        .padding(.vertical, 24)
                })
                .overlay {
                    UnevenRoundedRectangle(cornerRadii: .init(
                        topLeading: 10,
                        bottomLeading: 0,
                        bottomTrailing: 0,
                        topTrailing: 10
                    ))
                    .strokeBorder(lineWidth: 1)
                }
                
            }
            .sheet(
                isPresented: $viewModel.showingRecommendedPrompts,
                content: {
                    VStack {
                        Text("추천 프롬프트")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .frame(
                                maxWidth: .infinity,
                                alignment: .leading
                            )
                            .padding(.horizontal)
                            .padding(.vertical, 8)
                        List(
                            viewModel.recommendedPrompts,
                            id: \.id
                        ) { prompt in
                            HStack {
                                Text(prompt.text)
                                Spacer()
                                KFImage(prompt.imageURL)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(maxWidth: 100, alignment: .trailing)
                            }
                            .onTapGesture {
                                viewModel.selectedPrompt = prompt
                            }
                        }.listStyle(.plain)
                    }
                    .padding(.vertical)
                    .presentationDetents([.medium, .large])
                    .presentationDragIndicator(.automatic)
            })
        }.task {
            await viewModel.loadRecentPrompts()
            await viewModel.loadUsage()
        }
    }
}

#Preview {
    UploadPostView(tabIndex: .constant(0))
}
