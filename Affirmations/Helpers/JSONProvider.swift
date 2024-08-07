//
//  JSONProvider.swift
//  Affirmations
//
//  Created by Vladislav Avrutin on 07.08.2024.
//

import Foundation

class JSONProvider: ObservableObject {
    
    static let jsonData = "JsonData.json"
    @Published var affirmations: AffirmationsModel?
    
    func getData(){
        if let url = Bundle.main.url(forResource: JSONProvider.jsonData, withExtension: nil) {
            if let data = try? Data(contentsOf: url) {
                let jsonDecoder = JSONDecoder()
                do {
                    let result = try? jsonDecoder.decode(AffirmationsModel.self, from: data)
                    affirmations = result
                }
            }
        }
    }

}
