//
//  AffirmationsModel.swift
//  Affirmations
//
//  Created by Vladislav Avrutin on 07.08.2024.
//

import Foundation

struct AffirmationsModel : Codable {
    let love : [String]
    let friendship : [String]
    
    enum CodingKeys: String, CodingKey {

        case love = "love"
        case friendship = "friendship"
    }
}
