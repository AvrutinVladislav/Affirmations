//
//  SettingsModel.swift
//  Affirmations
//
//  Created by Vladislav Avrutin on 02.08.2024.
//

import Foundation

class SettingsModel: ObservableObject {
    @Published var category: Categories = .love
    @Published var gender: Gender = .male
    @Published var backgroundColor: Background = .blue
    @Published var language: Languages = .eng
}

enum Titles: Hashable, CaseIterable, Equatable {
    case category
    case gender
    case backgroundColor
    case language
    
    var title: String {
        switch self {
        case .category:
            "Category"
        case .gender:
            "Gender"
        case .backgroundColor:
            "Background"
        case .language:
            "Language"
        }
    }
    
    static subscript(indexPath: IndexPath) -> Titles {
        guard indexPath.row < Titles.allCases.count else {
            fatalError("Index out of range")
        }
        return Titles.allCases[indexPath.row]
    }
}

enum Categories: Hashable, Equatable {
    case love
    case friendship
    
    var description: String {
        switch self {
        case .love:
            "Love"
        case .friendship:
            "Friendship"
        }
    }
}

enum Gender: Hashable, CaseIterable, Equatable {
    case male
    case female
    
    var gender: String {
        switch self {
        case .male:
            "Male"
        case .female:
            "Female"
        }
    }
}

enum Background: Hashable, CaseIterable, Equatable {
    case blue
    case red
    
    var color: String {
        switch self {
        case .blue:
            "Blue"
        case .red:
            "Red"
        }
    }
}

enum Languages: Hashable, CaseIterable, Equatable {
    case eng
    case rus
    
    var language: String {
        switch self {
        case .eng:
            "Eng"
        case .rus:
            "Rus"
        }
    }
}
