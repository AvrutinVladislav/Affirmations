//
//  AffirmationsView.swift
//  Affirmations
//
//  Created by Vladislav Avrutin on 31.07.2024.
//

import SwiftUI

struct AffirmationsView: View {
    
    @AppStorage("selectCategory") var category = ""
    @AppStorage("selectGender") var gender = ""
    @AppStorage("selectBackgroundColor") var backgroundColor = ""
    
    @State private var moveToSettings = false
    
    @StateObject private var viewModel = AffirmationsViewModel()
    @StateObject private var settings = SettingsModel()
    @StateObject private var jsonProvider = JSONProvider()
    
    var body: some View {
        NavigationStack {
            ZStack {
                viewModel.selectBackgroundColor(settings)
                VStack {
                    HStack {
                        Spacer()
                        NavigationLink {
                            SettingsView(settings: settings)
                                .navigationBarBackButtonHidden(true)
                        } label: {
                            Image(systemName: "gearshape")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 35, height: 35)
                        }
                        .foregroundStyle(.white)
                        .padding(.init(top: 10, leading: 0, bottom: 10, trailing: 20))
                    }
                    .padding(.init(top: 50, leading: 0, bottom: 0, trailing: 0))
                    Spacer()
                    
                    ScrollView(.init()) {
                        ZStack {
                            GeometryReader { proxy in
                                TabView() {
                                    ForEach(viewModel.selectCategory(settings, jsonProvider.affirmations), id: \.self) { index in
                                        VStack() {
                                            Text(index.localized())
                                                .font(.largeTitle)
                                                .multilineTextAlignment(.center)
                                        }
                                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                                        
                                    }
                                    .frame(width: proxy.size.width, height: proxy.size.height)
                                    .rotationEffect(.degrees(-90))
                                }
                                .frame(width: proxy.size.height, height: proxy.size.width)
                                .rotationEffect(.degrees(90), anchor: .topLeading)
                                .offset(x: proxy.size.width)
                            }
                            .tabViewStyle(
                                PageTabViewStyle(indexDisplayMode: .never)
                            )
                        }
                        .navigationBarTitle("")
                        .navigationBarHidden(true)
                        .navigationBarBackButtonHidden(true)
                        .ignoresSafeArea()
                        
                    }
                    
                    Spacer()
                }
                .padding()
                .foregroundStyle(.white)
            }
                .ignoresSafeArea()
        }
        .onAppear {
            viewModel.configureSettings(settings, category, gender, backgroundColor)
            jsonProvider.getData()
        }
    }
    
}

//#Preview {
//    AffirmationsView(language: "en")
//}
