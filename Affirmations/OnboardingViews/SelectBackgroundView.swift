//
//  SelectBackgroundView.swift
//  Affirmations
//
//  Created by Vladislav Avrutin on 01.08.2024.
//

import SwiftUI

struct SelectBackgroundView: View {
    @State private var showAffirmations = false
    @StateObject var viewModel = OnboardingViewModel()
    
    var body: some View {
        OnboardingBaseView(title: Titles.category.title.localized(),
                           firstButtonTitle: Background.blue.color.localized(),
                           secondButtonTitle: Background.red.color.localized(),
                           firstButtonAction: {
            viewModel.selectCategory(Gender.male.gender.localized())
            showAffirmations.toggle()
            viewModel.firstLaunch()
        },
                           secondButtonAction: {
            viewModel.selectCategory(Gender.female.gender.localized())
            showAffirmations.toggle()
            viewModel.firstLaunch()
        })
        .navigationDestination(isPresented: $showAffirmations) {
            AffirmationsView()
                .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    SelectBackgroundView()
}
