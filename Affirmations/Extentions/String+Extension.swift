//
//  String+Extension.swift
//  Affirmations
//
//  Created by Vladislav Avrutin on 06.08.2024.
//

import Foundation
extension String {
    func localized() -> String {
        if let path = Bundle.main.path(forResource: UserDefaults.standard.string(forKey: "language"), ofType: "lproj"), let bundle = Bundle(path: path) {
            return NSLocalizedString(self, bundle: bundle, comment: "")
        }
        return ""
    }
}
