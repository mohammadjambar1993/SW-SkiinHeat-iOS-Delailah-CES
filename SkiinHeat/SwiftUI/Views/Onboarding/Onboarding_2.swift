//
//  Onboarding_2.swift
//  SkiinHeat
//
//  Created by Didier Dorelien on 2019-07-23.
//  Copyright © 2019 Myant. All rights reserved.
//

import SwiftUI
import SkiinBLE

struct Onboarding_2: View {
    
    private var hasOneConnected: Bool { return self.skiinBLE.peripherals.baseLayer.top.cbPeripheral != nil || self.skiinBLE.peripherals.baseLayer.bottom.cbPeripheral != nil}
    
    @EnvironmentObject var skiinBLE: SkiinBLE
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @State var destinationDisabled: Bool = true
    
    var body: some View {
        VStack(alignment: .center, spacing: 30) {
            
            Spacer()
            
            GetNavigationProgress(for: .two)
            
            Text("Pair with Bluetooth")
              .font(
                Font.custom("Mulish", size: 26)
                  .weight(.bold)
              )
              .multilineTextAlignment(.center)
              .foregroundColor(.black)
              .frame(width: 308, height: 32, alignment: .top)
            
            Text("When paired, the blue light on your pod will blink twice. ")
              .font(
                Font.custom("Mulish", size: 16)
                  .weight(.semibold)
              )
              .multilineTextAlignment(.center)
              .foregroundColor(.black)
              .frame(width: 274, height: 46, alignment: .top)
            
            Text( self.hasOneConnected ? "Pod is connected" : "Place the Pod close to your device" )
              .font(
                Font.custom("Mulish", size: 16)
                  .weight(.bold)
              )
              .multilineTextAlignment(.center)
              .foregroundColor(Color(red: 0.84, green: 0.13, blue: 0.16))
              .frame(width: 274, height: 26, alignment: .top)


            
            Image(hasOneConnected ? "podConnected": "podPairing")
            
            GetNavigationLink(for: .two, text: "Continue", destination: Onboarding_3(), destinationDisabled: self.destinationDisabled, back: Onboarding_1())
            
            Spacer()
            
        }
        .onAppear { self.skiinBLE.start() }
        .padding()
        .edgesIgnoringSafeArea(.top)
        .alert(isPresented: self.$skiinBLE.showStateAlert, content: { () -> Alert in
            
            let state = self.skiinBLE.centralManager!.state
            
            var message = ""
            
            switch state {
            case .unknown:
                message = "Bluetooth state is unknown"
            case .resetting:
                message = "Bluetooth is resetting..."
            case .unsupported:
                message = "This device doesn't have a bluetooth radio."
            case .unauthorized:
                message = "Turn On Bluetooth In The Settings App to Allow SKIIN Battery to Connect to Skiin App."
            case .poweredOff:
                message = "Turn On Bluetooth to Allow SKIIN Battery to Connect to Skiin App."
            case .poweredOn:
                break
            @unknown default:
                break
            }
            
            return Alert(title: Text("Bluetooth is \(self.skiinBLE.getStateString())"), message: Text(message), dismissButton: .default(Text("OK")))
        })
            .onReceive(self.skiinBLE.objectWillChange) { _ in
                self.destinationDisabled = !self.hasOneConnected
        }
        
    }
}
