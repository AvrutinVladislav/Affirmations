//
//  SettingsView.swift
//  Affirmations
//
//  Created by Vladislav Avrutin on 31.07.2024.
//

import SwiftUI

struct SettingsView: View {
    
    @StateObject var viewModel = SettingsViewModel()
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var settings: SettingsModel
    
    var body: some View {
        ZStack {
            VStack {
                HStack{
                    Button{
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "chevron.backward")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 10, height: 20)
                            .foregroundStyle(.black)
                    }
                    Spacer()
                    Text("Settings".localized())
                        .font(.title)
                        .foregroundStyle(.black)
                    Spacer()
                }
                .padding(.init(top: 20, leading: 20, bottom: 0, trailing: 0))
                List(viewModel.settingsCells) { cell in
                    SettingsTableViewCell(model: cell, settings: settings)
                }
                .background {
                    viewModel.selectBackgroundColor(settings)
                }
                .scrollContentBackground(.hidden)
            }
        } 
    }
}
