//
//  SelectGenderView.swift
//  Affirmations
//
//  Created by Vladislav Avrutin on 01.08.2024.
//

import SwiftUI

struct SelectGenderView: View {
    @State private var showSelectBackgroundView = false
    @StateObject var viewModel = OnboardingViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                Text(Titles.gender.title.localized())
                    .font(.system(size: 35, weight: .medium))
                    .padding(.init(top: 0, leading: 20, bottom: 50, trailing: 20))
                
                Button {
                    viewModel.selectGender("Male")
                    showSelectBackgroundView.toggle()
                } label: {
                    Text("Male".localized())
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
                    viewModel.selectGender("Female")
                    showSelectBackgroundView.toggle()
                } label: {
                    Text("Female".localized())
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
            .navigationDestination(isPresented: $showSelectBackgroundView) {
                SelectBackgroundView()
                    .navigationBarBackButtonHidden(true)
            }
        }
    }
    
   
}

#Preview {
    SelectGenderView()
}
