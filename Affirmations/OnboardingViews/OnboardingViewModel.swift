//
//  OnboardingViewModel.swift
//  Affirmations
//
//  Created by Vladislav Avrutin on 01.08.2024.
//

import Foundation

class OnboardingViewModel: ObservableObject {
    
    func selectCategory(_ category: String, _ defaultSettings: DefaultSettings) {
        defaultSettings.category = category
    }
    
    func selectGender(_ gender: String, _ defaultSettings: DefaultSettings) {
        defaultSettings.gender = gender
    }
    
    func selectBackgroundColor(_ backgroundColor: String, _ defaultSettings: DefaultSettings) {
        defaultSettings.backgroundColor = backgroundColor
    }
    
    func firstLaunch(_ defaultSettings: DefaultSettings) {
        defaultSettings.isFirstLaunch.toggle()
    }
}
