//
//  DashboardNew.swift
//  SkiinHeat
//
//  Created by Kane Denzil Quadras Bernard on 2024-11-23.
//  Copyright © 2024 Myant. All rights reserved.
//

import SkiinBLE
import SwiftUI

struct Dashboard: View {
    @EnvironmentObject var skiinBLE: SkiinBLE
    @State private var hasConnected: Bool = false

    @State private var selectedLayer: HeatPeripheral.HeatLayer = .top(
        element: .top, temp: .low)
    @State private var frontBandSelected: HeatPeripheral.FrontLayer =
        .frontSide(element: .frontSide, temp: .low)
    @State private var backBandSelected: HeatPeripheral.BackLayer = .backSide(
        element: .backSide, temp: .low)
    @State private var backToggleOn = false
    @State private var frontToggleOn = false

    @State var sliderValueFront: Double = 5.0
    @State var sliderValueBack: Double = 5.0

    @State var sliderIntensityFront: Intensity = .low
    @State var sliderIntensityBack: Intensity = .low

    @State var frontImage: String = "frontOff"
    @State var backImage: String = "backOff"

    private var topLayer: HeatPeripheral {
        self.skiinBLE.peripherals.baseLayer.top
    }
    private var frontLayer: HeatPeripheral {
        self.skiinBLE.peripherals.baseLayer.frontBand
    }
    private var backLayer: HeatPeripheral {
        self.skiinBLE.peripherals.baseLayer.backBand
    }

    private var frontLayerDisabled: Bool {
        switch self.frontBandSelected {
        case .frontSide(let element, _):
            switch element {
            case .frontSide:
                return !frontToggleOn
            }
        }
    }

    private var backLayerDisabled: Bool {
        switch self.backBandSelected {
        case .backSide(let element, _):
            switch element {
            case .backSide:
                return !backToggleOn
            }
        }
    }

    private var bothLayerDisabled: Bool {
        if frontLayerDisabled == false || backLayerDisabled == false {
            return false
        } else {
            return true
        }
    }

    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    VStack(alignment: .center) {
                        Image("heatDashboardLogo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                        Text("Heat Wrap")
                            .font(Font.custom("Mulish", size: 20).weight(.bold))
                            .kerning(0.1)
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color(hex: "#033761"))
                            .frame(width: 108, height: 27, alignment: .center)
                    }
                    HStack(alignment: .center) {
                        Image(
                            self.hasConnected
                                ? "bluetooth_connected"
                                : "bluetooth_disconnected")
                    }
                    if !hasConnected {
                        HeatAlertControl(isPodDisconnected: $hasConnected)
                    }
                    VStack(spacing: 40) {
                        HeatController(
                            controlSide: "Front",
                            onValueChanged: { newValue in
                                switch newValue {
                                case 5.0:
                                    frontImage = "frontOff"
                                    self.skiinBLE.handlePodCommands(
                                        stateToBeSet: .off,
                                        channelToCall: .front)
                                    print("OFF COMMAND SELECTED FOR FRONT")
                                    break
                                case 33.0:
                                    frontImage = "frontLow"
                                    self.skiinBLE.handlePodCommands(
                                        stateToBeSet: .low,
                                        channelToCall: .front)
                                    print("low COMMAND SELECTED FOR FRONT")
                                    break
                                case 63.0:
                                    frontImage = "frontMedium"
                                    self.skiinBLE.handlePodCommands(
                                        stateToBeSet: .medium,
                                        channelToCall: .front
                                    )
                                    print("Medium COMMAND SELECTED FOR FRONT")
                                    break
                                case 92.0:
                                    frontImage = "frontHigh"
                                    self.skiinBLE.handlePodCommands(
                                        stateToBeSet: .high,
                                        channelToCall: .front)
                                    print("High COMMAND SELECTED FOR FRONT")
                                    break
                                default:
                                    print("This should not happen")
                                    break
                                }
                            }, imageName: frontImage,
                            sliderValue: $sliderValueFront,
                            selectedIntensity: $sliderIntensityFront)
                        HeatController(
                            controlSide: "Back",
                            onValueChanged: { newValue in
                                switch newValue {
                                case 5.0:
                                    backImage = "backOff"
                                    self.skiinBLE.handlePodCommands(
                                        stateToBeSet: .off, channelToCall: .back
                                    )
                                    print("OFF COMMAND SELECTED FOR BACK")
                                    break
                                case 33.0:
                                    backImage = "backLow"
                                    self.skiinBLE.handlePodCommands(
                                        stateToBeSet: .low, channelToCall: .back
                                    )
                                    print("Low COMMAND SELECTED FOR BACK")
                                    break
                                case 63.0:
                                    backImage = "backMedium"
                                    self.skiinBLE.handlePodCommands(
                                        stateToBeSet: .medium,
                                        channelToCall: .back)
                                    print("Medium COMMAND SELECTED FOR BACK")
                                    break
                                case 92.0:
                                    backImage = "backHigh"
                                    self.skiinBLE.handlePodCommands(
                                        stateToBeSet: .high,
                                        channelToCall: .back)
                                    print("High COMMAND SELECTED FOR BACK")
                                    break
                                default:
                                    print("This should not happen")
                                    break
                                }
                            }, imageName: backImage,
                            sliderValue: $sliderValueBack,
                            selectedIntensity: $sliderIntensityBack)
                    }
                    .disabled(self.hasConnected != true)
                    .opacity(self.hasConnected ? 1 : 0.4)
                    Spacer()
                }.padding()
                    .navigationBarItems(
                        leading:
                            NavigationLink(destination: Menu()) {
                                Image(systemName: "line.3.horizontal")
                                    .font(Font.title.weight(.bold))
                                    .foregroundColor(
                                        Color(
                                            red: 3 / 255, green: 55 / 255,
                                            blue: 97 / 255))
                            }
                    )
            }
        }.onAppear(perform: {
            UserDefaults.standard.set(true, forKey: "onboarding")
            self.skiinBLE.update()
            self.update()
        })
        .onReceive(self.skiinBLE.objectWillChange) { _ in
            self.update()
        }
    }

    func update() {
        self.hasConnected =
            self.topLayer.cbPeripheral?.state != .disconnected
            && self.skiinBLE.peripherals.baseLayer.top.cbPeripheral != nil

    }
}
