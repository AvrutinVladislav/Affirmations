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
    
    @Published var loveAffermations = ["I am worthy of love and deserve to receive love in abundance", "My heart is open to giving and receiving love", "I am surrounded by love every day and in every way", "I attract love and loving relationships into my life", "Love flows to me and through me effortlessly", "I radiate love and others reflect love back to me", "My relationships are filled with love, happiness, and respect", "I am grateful for the love that surrounds me", "Love comes to me easily and effortlessly", "I am a magnet for loving and fulfilling relationships"]
    
    @Published var friendshipAffermations = ["I am surrounded by supportive and loving friends", "I attract positive and loyal friendships into my life", "My friends and I share mutual respect and trust", "I am a kind and caring friend, and I receive the same in return", "My friendships are filled with joy, laughter, and understanding", "I am grateful for the amazing friends in my life", "I nurture and cherish my friendships", "I attract friends who support and uplift me", "My friends and I grow together in love and harmony", "I am a magnet for genuine and lasting friendships"]
    
    func selectCategory(_ settings: SettingsModel) -> [String] {
        switch settings.category {
        case .love:
            return loveAffermations
        case .friendship:
            return friendshipAffermations
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
