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
            OnboardingBaseView(title: Titles.category.title.localized(),
                               firstButtonTitle: Categories.love.description.localized(),
                               secondButtonTitle: Categories.friendship.description.localized(),
                               firstButtonAction: {viewModel.selectCategory(Categories.love.description.localized())
                                    showSelectGenderView.toggle() },
                               secondButtonAction: {viewModel.selectCategory(Categories.friendship.description.localized())
                                    showSelectGenderView.toggle() })
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
