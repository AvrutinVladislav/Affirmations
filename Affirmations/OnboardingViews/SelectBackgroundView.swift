//
//  SelectBackgroundView.swift
//  Affirmations
//
//  Created by Vladislav Avrutin on 01.08.2024.
//

import SwiftUI

struct SelectBackgroundView: View {
    @State private var showAffirmations = false
    @StateObject var viewModel = OnboardingViewModel()
    
    var body: some View {
        VStack {
            Spacer()
            Text(Titles.backgroundColor.title.localized())
                .font(.system(size: 35, weight: .medium))
                .padding(.init(top: 0, leading: 20, bottom: 50, trailing: 20))
            Button {
                viewModel.selectBackgroundColor("Blue")
                showAffirmations.toggle()
                viewModel.firstLaunch()
            } label: {
                Text("Blue")
                    .foregroundStyle(.white)
                    .font(.system(size: 20, weight: .medium))
            }
            .frame(width: 150, height: 50)
            .background {
                Color.blue
            }
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            
            Button {
                showAffirmations.toggle()
                viewModel.selectBackgroundColor("Red")
                viewModel.firstLaunch()
            } label: {
                Text("Red".localized())
                    .foregroundStyle(.white)
                    .font(.system(size: 20, weight: .medium))
            }
            .frame(width: 150, height: 50)
            .background {
                Color.red
            }
            .clipShape(RoundedRectangle(cornerRadius: 12))

            Spacer()
               
        }
        .foregroundStyle(.black)
        .navigationDestination(isPresented: $showAffirmations) {
            AffirmationsView()
                .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    SelectBackgroundView()
}
