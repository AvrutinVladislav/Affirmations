//
//  DefaultSettings.swift
//  Affirmations
//
//  Created by Vladislav Avrutin on 10.08.2024.
//

import Foundation
import SwiftUI

//enum SettingsKeys: String {
//    case config
//    
//    var category: String { return "category"}
//    var gender: String { return "gender"}
//    var backgroundColor: String { return "backgroundColor"}
//    var language: String { return "language"}
//    var isFirstLaunch: String { return "isFirstLaunch"}
//}

enum LanguageKeys: String {
    case eng = "en"
    case rus = "ru"
}

class DefaultSettings: ObservableObject {
    @AppStorage("category") public var category = ""
    @AppStorage("gender") public var gender = ""
    @AppStorage("backgroundColor") public var backgroundColor = ""
    @AppStorage("language") public var language = LanguageKeys.eng
    @AppStorage("isFirstLaunch") public var isFirstLaunch = true
}
