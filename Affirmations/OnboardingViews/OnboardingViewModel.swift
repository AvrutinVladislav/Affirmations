//
//  OnboardingViewModel.swift
//  Affirmations
//
//  Created by Vladislav Avrutin on 01.08.2024.
//

import Foundation
import SwiftUI

class OnboardingViewModel: ObservableObject {
    
    @AppStorage("selectCategory") var selectCategory = ""
    @AppStorage("selectGender") var selectGender = ""
    @AppStorage("selectBackgroundColor") var selectBackgroundColor = ""
    @AppStorage("isFirstLaunch") var isFirstLaunch: Bool = true
    
    func selectCategory(_ category: String) {
        selectCategory = category
    }
    
    func selectGender(_ gender: String) {
        selectGender = gender
    }
    
    func selectBackgroundColor(_ backgroundColor: String) {
        selectBackgroundColor = backgroundColor
    }
    
    func firstLaunch() {
        isFirstLaunch.toggle()
    }
}
