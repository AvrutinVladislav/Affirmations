//
//  SettingsTableViewCell.swift
//  Affirmations
//
//  Created by Vladislav Avrutin on 31.07.2024.
//

import SwiftUI

struct SettingsTableViewCell: View {
    
    @StateObject var viewModel = SettingsTableViewCellViewModel()
    @Environment(\.locale) var locale
    @ObservedObject var settings: SettingsModel
    @State var isFirstButtonDidTap: Bool = true
    
    var model: SettingsCellModel
    
    var body: some View {
        
        HStack {
            Text(model.title.title.localized())
                .padding(.init(top: 15, leading: 10, bottom: 15, trailing: 0))
                .multilineTextAlignment(.center)
                .font(.system(size: 16, weight: .regular))
            Spacer()
            HStack {
                Button(action: {
                    viewModel.buttonDidTap(settings, model, isFirstButtonDidTap)
                },
                       label: {
                    Text(model.firstChoice.localized())
                        .foregroundStyle( model.firstChoice == viewModel.configureButton(settings, model) ? .black : .white)
                        .font(.system(size: 14, weight: .regular))
                })
                .frame(width: 85, height: 50)
                .background {
                    model.firstChoice == viewModel.configureButton(settings, model)  ? Color.green : Color.red
                }
                .buttonBorderShape(.capsule)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                
                Button(action: {
                    isFirstButtonDidTap.toggle()
                },
                       label: {
                    Text(model.secondChoice.localized())
                        .foregroundStyle( model.secondChoice == viewModel.configureButton(settings, model) ? .black : .white)
                        .font(.system(size: 14, weight: .regular))
                })
                .scaledToFill()
                .frame(width: 85, height: 50)
                .background(
                    RoundedRectangle(
                        cornerRadius: 12,
                        style: .continuous
                    )
                    .fill(model.secondChoice == viewModel.configureButton(settings, model)  ? Color.green : Color.red)
                )
                .clipShape(RoundedRectangle(cornerRadius: 12))
            }
        }
        .background {
            Color.black.opacity(0.1)
        }
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}
