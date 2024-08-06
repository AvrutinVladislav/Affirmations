//
//  AffirmationsApp.swift
//  Affirmations
//
//  Created by Vladislav Avrutin on 31.07.2024.
//

import SwiftUI

@main
struct AffirmationsApp: App {
    
    @AppStorage("isFirstLaunch") var isFirstLaunch: Bool = true
    @AppStorage("language") var language: String = "en"
    
    var body: some Scene {
        WindowGroup {
            
            if isFirstLaunch {
                SelectCategoryView()
            }
            else {
                AffirmationsView()
            }
        }
    }
}
