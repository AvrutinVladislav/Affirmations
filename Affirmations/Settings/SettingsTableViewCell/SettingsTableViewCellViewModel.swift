//
//  SettingsTableViewCellViewModel.swift
//  Affirmations
//
//  Created by Vladislav Avrutin on 01.08.2024.
//

import Foundation
import SwiftUI

class SettingsTableViewCellViewModel: ObservableObject {
    
    @AppStorage("language") var language: String = "en"
    
    func configureButton(_ settings: SettingsModel, _ cellModel: SettingsCellModel) -> String {
        switch cellModel.title {
        case .category:
            return settings.category.description
        case .gender:
            return settings.gender.gender
        case .backgroundColor:
            return settings.backgroundColor.color
        case .language:
            return settings.language.language
        }
    }
    
    func buttonDidTap(_ settings: SettingsModel, _ cellModel: SettingsCellModel, _ isFirstButtonDidTap: Bool) {
        switch cellModel.title {
        case .category:
            if isFirstButtonDidTap {
                settings.category = .love
            } else {
                settings.category = .friendship
            }
        case .gender:
            if isFirstButtonDidTap {
                settings.gender = .male
            } else {
                settings.gender = .female
            }
        case .backgroundColor:
            if isFirstButtonDidTap {
                settings.backgroundColor = .blue
            } else {
                settings.backgroundColor = .red      
            }
        case .language:
            if isFirstButtonDidTap {
                language = Languages.eng.language
                settings.language = .eng
            }
            else {
                language = Languages.rus.language
                settings.language = .rus
            }
        }
    }
    
    func getBackgroundColor(from value: String) -> Background {
        switch value {
        case "Blue":
            return .blue
        case "Red":
            return .red
        default:
            return .blue
        }
    }
    
    func changeLanguage() {
        
    }
}
