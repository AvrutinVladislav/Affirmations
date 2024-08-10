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
    @EnvironmentObject var defaultSettings: DefaultSettings
    
    var body: some View {
        OnboardingBaseView(title: Titles.backgroundColor.title.localized(),
                           firstButtonTitle: Background.blue.color.localized(),
                           secondButtonTitle: Background.red.color.localized(),
                           firstButtonAction: {
            viewModel.selectBackgroundColor(Background.blue.color.localized(), defaultSettings)
            showAffirmations.toggle()
            viewModel.firstLaunch(defaultSettings) },
                           secondButtonAction: {
            viewModel.selectBackgroundColor(Background.red.color.localized(), defaultSettings)
            showAffirmations.toggle()
            viewModel.firstLaunch(defaultSettings)
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
