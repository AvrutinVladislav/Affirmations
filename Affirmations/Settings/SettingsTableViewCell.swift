//
//  SettingsTableViewCell.swift
//  Affirmations
//
//  Created by Vladislav Avrutin on 31.07.2024.
//

import SwiftUI

struct SettingsTableViewCell: View {
    
    var model: SettingsCellModel
    
    var body: some View {

        HStack {
            Text(model.title)
                .padding()
                .multilineTextAlignment(.center)
                .font(.system(size: 18, weight: .regular))
            Spacer()
            HStack {
                customButton(model.firstChoice, .white, .black)
                customButton(model.secondChoice, .black, .white)
            }
           
        }
        
    }
    
    @ViewBuilder private func customButton(_ buttonText: String, _ textColor: Color, _ buttonColor: Color) -> some View {
        Button {
            
        } label: {
            Text(buttonText)
                .foregroundStyle(textColor)
                .font(.system(size: 14, weight: .regular))
        }
        .frame(width: 75, height: 50)
        .background {
            buttonColor
        }
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}
