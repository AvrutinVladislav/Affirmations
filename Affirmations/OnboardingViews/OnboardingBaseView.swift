//
//  OnboardingBaseView.swift
//  Affirmations
//
//  Created by Vladislav Avrutin on 07.08.2024.
//

import SwiftUI

struct OnboardingBaseView: View {
    @StateObject var viewModel = OnboardingViewModel()
    var title: String
    var firstButtonTitle: String
    var secondButtonTitle: String
    var firstButtonAction: (() -> Void)
    var secondButtonAction: (() -> Void)
    
    var body: some View {
        VStack {
            Spacer()
            Text(title.localized())
                .font(.system(size: 35, weight: .medium))
                .padding(.init(top: 0, leading: 20, bottom: 50, trailing: 20))
            Button {
                firstButtonAction()
            } label: {
                Text(firstButtonTitle.localized())
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
                secondButtonAction()
            } label: {
                Text(secondButtonTitle.localized())
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
        
    }
}

//#Preview {
//    OnboardingBaseView()
//}
