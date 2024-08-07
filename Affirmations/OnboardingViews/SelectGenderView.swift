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
            OnboardingBaseView(title: Titles.category.title.localized(),
                               firstButtonTitle: Gender.male.gender.localized(),
                               secondButtonTitle: Gender.female.gender.localized(),
                               firstButtonAction: {
                viewModel.selectCategory(Gender.male.gender.localized())
                showSelectBackgroundView.toggle()
            },
                               secondButtonAction: {
                viewModel.selectCategory(Gender.female.gender.localized())
                showSelectBackgroundView.toggle()
            })
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
