//
//  SettingsTableViewCellViewModel.swift
//  Affirmations
//
//  Created by Vladislav Avrutin on 01.08.2024.
//

import Foundation

class SettingsTableViewCellViewModel: ObservableObject {
    
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
    
    func buttonDidTap(_ settings: SettingsModel, _ cellModel: SettingsCellModel, _ isFirstButtonDidTap: Bool, _ isSecondButtonDidTap: Bool, _ defaultSettings: DefaultSettings) {
        switch cellModel.title {
        case .category:
            if isFirstButtonDidTap {
                settings.category = .love
                defaultSettings.category = Categories.love.description
            }
            else if isSecondButtonDidTap {
                settings.category = .friendship
                defaultSettings.category = Categories.friendship.description
            }
        case .gender:
            if isFirstButtonDidTap {
                settings.gender = .male
                defaultSettings.gender = Gender.male.gender
            }
            else if isSecondButtonDidTap {
                settings.gender = .female
                defaultSettings.gender = Gender.female.gender
            }
        case .backgroundColor:
            if isFirstButtonDidTap {
                settings.backgroundColor = .blue
                defaultSettings.backgroundColor = Background.blue.color
            }
            else if isSecondButtonDidTap {
                settings.backgroundColor = .red
                defaultSettings.backgroundColor = Background.red.color
            }
        case .language:
            if isFirstButtonDidTap {
                defaultSettings.language = LanguageKeys.eng
                settings.language = .eng
            }
            else if isSecondButtonDidTap {
                defaultSettings.language = LanguageKeys.rus
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
