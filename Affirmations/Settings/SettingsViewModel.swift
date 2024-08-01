//
//  SettingsViewModel.swift
//  Affirmations
//
//  Created by Vladislav Avrutin on 31.07.2024.
//

import Foundation

class SettingsViewModel: ObservableObject {
    
    @Published var settingsCells = [
        SettingsCellModel(title: "Category", firstChoice: "Love", secondChoice: "Friendship"),
        SettingsCellModel(title: "Background", firstChoice: "Blue", secondChoice: "Red"),
        SettingsCellModel(title: "Gender", firstChoice: "Male", secondChoice: "Female"),
        SettingsCellModel(title: "Language", firstChoice: "Eng", secondChoice: "Rus")
    ]
}
