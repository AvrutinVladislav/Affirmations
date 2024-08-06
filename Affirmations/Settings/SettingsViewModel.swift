//
//  SettingsViewModel.swift
//  Affirmations
//
//  Created by Vladislav Avrutin on 31.07.2024.
//

import Foundation
import SwiftUI

class SettingsViewModel: ObservableObject {
    
    let settingsCells = [
        SettingsCellModel(title: .category,
                          firstChoice: Categories.love.description,
                          secondChoice: Categories.friendship.description),
        SettingsCellModel(title: .gender,
                          firstChoice: Gender.male.gender,
                          secondChoice: Gender.female.gender),
        SettingsCellModel(title: .backgroundColor,
                          firstChoice: Background.blue.color,
                          secondChoice: Background.red.color),
        SettingsCellModel(title: .language,
                          firstChoice: Languages.eng.language,
                          secondChoice: Languages.rus.language)
    ]
    
    func selectBackgroundColor(_ settings: SettingsModel) -> Color {
        switch settings.backgroundColor {
        case .blue:
            return Color.blue
        case .red:
            return Color.red
        }
    }
    
}
