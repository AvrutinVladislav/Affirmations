//
//  SelectCategoryView.swift
//  Affirmations
//
//  Created by Vladislav Avrutin on 01.08.2024.
//

import SwiftUI

struct SelectCategoryView: View {
    @State private var showSelectGenderView = false
    @StateObject var viewModel = OnboardingViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                Text(Titles.category.title.localized())
                    .font(.system(size: 35, weight: .medium))
                    .padding(.init(top: 0, leading: 20, bottom: 50, trailing: 20))
                
                Button {
                    viewModel.selectCategory("Love")
                    showSelectGenderView.toggle()
                } label: {
                    Text("Love".localized())
                        .foregroundStyle(.white)
                        .font(.system(size: 20, weight: .medium))
                }
                .frame(width: 150, height: 50)
                .background {
                    Color.black
                }
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .padding()
                
                Button {
                    viewModel.selectCategory = "Friendship"
                    showSelectGenderView.toggle()
                } label: {
                    Text("Friendship".localized())
                        .foregroundStyle(.white)
                        .font(.system(size: 20, weight: .medium))
                }
                .frame(width: 150, height: 50)
                .background {
                    Color.black
                }
                .clipShape(RoundedRectangle(cornerRadius: 12))
                
                Spacer()
                
            }
            .foregroundStyle(.black)
            .navigationDestination(isPresented: $showSelectGenderView) {
                SelectGenderView()
                    .navigationBarBackButtonHidden(true)
            }
            
        }
    }
}

#Preview {
    SelectCategoryView()
}
