//
//  CustomToggle.swift
//  Affirmations
//
//  Created by Vladislav Avrutin on 10.08.2024.
//

import Foundation
import SwiftUI

struct CustomToggle: ToggleStyle {
    var label = ""
    var onColor = Color(UIColor.green)
    var offColor = Color(UIColor.systemGray5)
    var thumbColor = Color.white
    var needSpacer = false
    var font: Font = .subheadline
    
    func makeBody(configuration: Self.Configuration) -> some View {
        HStack {
            Text(label)
            if needSpacer {
                Spacer()
            }
            Button(action: { configuration.isOn.toggle() } )
            {
                RoundedRectangle(cornerRadius: 16, style: .circular)
                    .fill(configuration.isOn ? onColor : offColor)
                    .frame(width: 50, height: 29)
                    .overlay(
                        Circle()
                            .fill(thumbColor)
                            .shadow(radius: 1, x: 0, y: 1)
                            .padding(1.5)
                            .offset(x: configuration.isOn ? 10 : -10))
                    .animation(.easeInOut, value: 0.1)
            }
        }
        .font(font)
        .padding(.horizontal)
    }
}
