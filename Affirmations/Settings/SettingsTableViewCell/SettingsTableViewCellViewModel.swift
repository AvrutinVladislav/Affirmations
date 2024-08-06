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
    
    func buttonDidTap(_ settings: SettingsModel, _ cellModel: SettingsCellModel, _ isActiveFirstButton: Bool) {
        switch cellModel.title {
        case .category:
            break
        case .gender:
            break
        case .backgroundColor:
            switch settings.backgroundColor {
            case .blue:
                settings.backgroundColor = .red
            case .red:
                settings.backgroundColor = .blue
            }
        case .language:
            break
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
