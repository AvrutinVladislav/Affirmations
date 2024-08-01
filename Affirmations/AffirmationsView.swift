//
//  AffirmationsView.swift
//  Affirmations
//
//  Created by Vladislav Avrutin on 31.07.2024.
//

import SwiftUI

struct AffirmationsView: View {
    
    @State private var moveToSettings = false
    @StateObject private var viewModel = AffirmationsViewModel()
    
    let loveAffermations = [ "I am worthy of love and deserve to receive love in abundance", "My heart is open to giving and receiving love", "I am surrounded by love every day and in every way", "I attract love and loving relationships into my life", "Love flows to me and through me effortlessly", "I radiate love and others reflect love back to me", "My relationships are filled with love, happiness, and respect", "I am grateful for the love that surrounds me", "Love comes to me easily and effortlessly", "I am a magnet for loving and fulfilling relationships"]
    
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                ZStack {
                    Color.red
                    VStack {
                        HStack {
                            Spacer()
                            NavigationLink {
                                SettingsView()
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
                        Spacer()
                        TabView {
                            ForEach(viewModel.loveAffermations, id: \.self) { item in
                                VStack(alignment: .center) {
                                    Text(item)
                                        .rotationEffect(.degrees(-90))
                                        .frame(width: geometry.size.width, height: geometry.size.height)
                                        .aspectRatio(contentMode: .fill)
                                        .font(.largeTitle)
                                        .padding(.init(top: 0, leading: 20, bottom: 0, trailing: 20))
                                        .background(Color.red)
                                        .multilineTextAlignment(.center)
                                }
                            }
                            .background(Color.red)
                            .frame(width: geometry.size.width, height: geometry.size.width)
                        }
                        
                        .rotationEffect(.degrees(90), anchor: .topLeading)
                        .offset(x: geometry.size.width * 1.3)
                        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                        
                        Spacer()
                    }
                    .padding()
                    .foregroundStyle(.white)
                }
            }
        }
    }
}

#Preview {
    AffirmationsView()
}
