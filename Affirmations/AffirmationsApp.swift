//
//  AffirmationsApp.swift
//  Affirmations
//
//  Created by Vladislav Avrutin on 31.07.2024.
//

import SwiftUI

@main
struct AffirmationsApp: App {
    
    @StateObject var defaultSettings = DefaultSettings()
    
    var body: some Scene {
        WindowGroup {
            
            if defaultSettings.isFirstLaunch {
                SelectCategoryView()
                    .environmentObject(defaultSettings)
            }
            else {
                AffirmationsView()
                    .environmentObject(defaultSettings)
            }
        }
    }
}
