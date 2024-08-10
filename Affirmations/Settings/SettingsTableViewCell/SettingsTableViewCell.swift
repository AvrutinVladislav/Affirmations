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
    @State private var isFirstButtonDidTap: Bool = true
    @State private var isSecondButtonDidTap: Bool = false
    @EnvironmentObject var defaultSettings: DefaultSettings
    
    var model: SettingsCellModel
    
    var body: some View {
        
        HStack {
            Text(model.title.title.localized())
                .padding(.init(top: 15, leading: 10, bottom: 15, trailing: 0))
                .multilineTextAlignment(.center)
                .font(.system(size: 16, weight: .regular))
            
            Spacer()
            
            VStack(alignment: .trailing) {
                   Toggle("", isOn: $isFirstButtonDidTap)
                    .toggleStyle(CustomToggle(
                        label: model.firstChoice.localized(),
                        offColor: .red
                    ))
                    .padding(.init(top: 10, leading: 0, bottom: 0, trailing: 0))
                    .onChange(of: isFirstButtonDidTap) { tapped in
                        if tapped {
                            isSecondButtonDidTap = false
                            viewModel.buttonDidTap(settings, model, isFirstButtonDidTap, isSecondButtonDidTap, defaultSettings)
                        }
                    }
                
                Toggle("", isOn: $isSecondButtonDidTap)
                 .toggleStyle(CustomToggle(
                     label: model.secondChoice.localized(),
                     offColor: .red
                 ))
                 .padding(.init(top: 0, leading: 0, bottom: 10, trailing: 0))
                 .onChange(of: isSecondButtonDidTap) { tapped in
                     if tapped {
                         isFirstButtonDidTap = false
                         viewModel.buttonDidTap(settings, model, isFirstButtonDidTap, isSecondButtonDidTap, defaultSettings)
                     }
                 }
            }
        }
        .background {
            Color.black.opacity(0.1)
        }
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .onAppear {
            isFirstButtonDidTap = model.firstChoice == viewModel.configureButton(settings, model)
            isSecondButtonDidTap = model.secondChoice == viewModel.configureButton(settings, model)
        }
    }
}
