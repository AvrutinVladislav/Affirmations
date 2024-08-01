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
    
    var body: some Scene {
        WindowGroup {
            AffirmationsView()
//            if isFirstLaunch {
//                
//            }
//            else {
//                AffirmationsView()
//            }
        }
    }
}
