//
//  SettingsCellModel.swift
//  Affirmations
//
//  Created by Vladislav Avrutin on 31.07.2024.
//

import Foundation

struct SettingsCellModel: Hashable, Identifiable {
    var id = UUID()
    var title: String
    var firstChoice: String
    var secondChoice: String
}
