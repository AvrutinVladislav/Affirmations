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
    @EnvironmentObject var defaultSettings: DefaultSettings
    
    var body: some View {
        NavigationStack {
            OnboardingBaseView(title: Titles.gender.title.localized(),
                               firstButtonTitle: Gender.male.gender.localized(),
                               secondButtonTitle: Gender.female.gender.localized(),
                               firstButtonAction: {
                viewModel.selectGender(Gender.male.gender.localized(), defaultSettings)
                showSelectBackgroundView.toggle()},
                               secondButtonAction: {
                viewModel.selectGender(Gender.female.gender.localized(), defaultSettings)
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
