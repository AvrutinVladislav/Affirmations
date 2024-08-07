//
//  AffirmationsViewModel.swift
//  Affirmations
//
//  Created by Vladislav Avrutin on 31.07.2024.
//

import Foundation
import SwiftUI

class AffirmationsViewModel: ObservableObject {
    
    @AppStorage("selectCategory") var category = ""
    @AppStorage("selectGender") var gender = ""
    @AppStorage("selectBackgroundColor") var backgroundColor = ""

    func selectCategory(_ settings: SettingsModel, _ affirmationsData: AffirmationsModel?) -> [String] {
        guard let data = affirmationsData else { return [] }
        switch settings.category {
        case .love:
            return data.love
        case .friendship:
            return data.friendship
        }
    }
    
    func selectBackgroundColor(_ settings: SettingsModel) -> Color {
        switch settings.backgroundColor {
        case .blue:
            return Color.blue
        case .red:
            return Color.red
        }
    }
    
    func configureSettings(_ settings: SettingsModel, _ category: String, _ gender: String, _ backgroundColor: String) {
        
        settings.category = getCategory(from: category)
        settings.gender = getGender(from: gender)
        settings.backgroundColor = getBackgroundColor(from: backgroundColor)
    }
    
    func getCategory(from value: String) -> Categories {
        switch value {
        case "Love":
            return .love
        case "Friendship":
            return .friendship
        default:
            return .love
        }
    }
    
    func getGender(from value: String) -> Gender {
        switch value {
        case "Male":
            return .male
        case "Female":
            return .female
        default:
            return .male
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
    
}
