//
//  ContentView.swift
//  Delailah Views
//
//  Created by Kane Bernard on 2024-10-07.
//

import SwiftUI

struct HeatController: View {
    var controlSide: String
    var onValueChanged: ((Double) -> Void)?
    var imageName: String
    var sliderValue:Binding<Double>
    var selectedIntensity:Binding<Intensity>
    
    var body: some View {
        ZStack() {
            Rectangle()
            .foregroundColor(.clear)
            .frame(width: 350, height: 200)
            .background(.white)
            .cornerRadius(6)
            .shadow(color: .gray, radius: 5, x: 5, y: 5)
            VStack() {
                HStack() {
                    Text(controlSide)
                        .textCase(.uppercase)
                      .font(
                        Font.custom("Lato", size: 24)
                          .weight(.bold)
                      )
                      .kerning(0.48)
                      .foregroundColor(Color(red: 0.01, green: 0.22, blue: 0.38))
                      .frame(width: 118, height: 21, alignment: .topLeading)
                    Spacer()
                    Image(imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 83.65, height: 72.93)
                }
                CustomSlider(value: sliderValue, range: 0...100, onValueChanged: onValueChanged)
            }            .frame(width: 320, height: 190)

        }
    }
}

#Preview {
    VStack(spacing: 40) {
        HeatController(controlSide: "Front", imageName: "frontOff", sliderValue: .constant(33.0), selectedIntensity: .constant(.low))
        HeatController(controlSide: "Back", imageName: "backOff", sliderValue: .constant(33.0), selectedIntensity: .constant(.low))
    }
}
