//
//  BottomNavigationView.swift
//  SkiinHeat
//
//  Created by Kane Denzil Quadras Bernard on 2024-12-04.
//  Copyright © 2024 Myant. All rights reserved.
//

import SwiftUI
import SkiinBLE

struct BottomNavigation: View {
    @EnvironmentObject var skiinBLE: SkiinBLE
    @State var selectedTab: Int = 0

    init() {
        // Set tab bar background color
        UITabBar.appearance().backgroundColor = UIColor(Color(.white))
        // Optional: Set tab bar unselected item color
        UITabBar.appearance().unselectedItemTintColor = UIColor.gray
    }

    var body: some View {
        TabView(selection: $selectedTab) {
            Dashboard()
                .background(Color.white)
                .environmentObject(self.skiinBLE)
                .tabItem {
                    Image(
                        selectedTab == 0
                            ? "heatControlFilledTab" : "heatControlTab")
                    Text("Controls")
                }
                .tag(0)
            AddSymptom(selectedTab: $selectedTab)
                .background(Color.white)
            
                .tabItem {
                    Image(
                        selectedTab == 1
                            ? "addSymptonFilledTab" : "addSymptomTab")
                    Text("Add Symptom")
                }
                .tag(1)
            Diary(selectedTab: $selectedTab)
                .background(Color.white)
                .tabItem {
                    Image(selectedTab == 2 ? "diarySelectedTab" : "diaryTab")
                    Text("Diary")
                }
                .tag(2)
        }
        .accentColor(Color(hex: "#A9321A"))
        .onAppear {
            print("SkiinBLE BottomNavigation is: \(skiinBLE)")
        }
    }
}
