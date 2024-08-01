//
//  SettingsView.swift
//  Affirmations
//
//  Created by Vladislav Avrutin on 31.07.2024.
//

import SwiftUI

struct SettingsView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @StateObject var viewModel = SettingsViewModel()
    
    var body: some View {
        
        VStack {
            HStack{
                
                Button{
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "chevron.backward")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 10, height: 20)
                }
                Spacer()
                Text("Settings")
                    .font(.title)
                Spacer()
            }
            .padding(.init(top: 0, leading: 20, bottom: 0, trailing: 0))
            List(viewModel.settingsCells) { cell in
                SettingsTableViewCell(model: cell)
            }
        }
    }
   
}

#Preview {
    SettingsView()
}
