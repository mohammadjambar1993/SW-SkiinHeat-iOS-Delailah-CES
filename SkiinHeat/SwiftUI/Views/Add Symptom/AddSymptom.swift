//
//  AddSymptom.swift
//  SkiinHeat
//
//  Created by Kane Denzil Quadras Bernard on 2025-01-02.
//  Copyright © 2025 Myant. All rights reserved.
//

import SwiftUI

struct AddSymptom: View {
    @ObservedObject var diaryViewModel = DiaryViewModel()
    @StateObject var symptomDataModel = SymptomDataModel()
    @State var notesText: String = ""
    @State var selectedDate: Date = Date()
    @ObservedObject private var keyboard = KeyboardResponder()
    @Binding var selectedTab: Int
    @State private var showingAlert = false // State to control alert visibility

    private func hideKeyboard() {
        UIApplication.shared.sendAction(
            #selector(UIResponder.resignFirstResponder), to: nil, from: nil,
            for: nil)
    }
    
    func setToDefault () {
        notesText = ""
        selectedDate = Date()
        symptomDataModel.selectedItems.removeAll()
    }

    var body: some View {
        VStack(spacing: 10) {
            Header(
                headerText: "Add a Symptom", stackAlignment: .leading,
                shouldShowBackButton: false
            ) {
                ScrollView {
                    VStack(spacing: 20) {
                        DateTimeView(selectedDate: $selectedDate)
                        SearchSymptom(
                            items: $symptomDataModel.items,
                            selectedItems: $symptomDataModel.selectedItems
                        )
                        .frame(minHeight: 520)
                        Notes(notesText: $notesText)
                        Button(action: {
                            diaryViewModel.addEntry(
                                entry: DiaryEntry(
                                    id: UUID(), date: selectedDate,
                                    notes: notesText,
                                    symptoms: Array(symptomDataModel.selectedItems)))
                            showingAlert = true
                        }) {
                            Text("Save")
                                .foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))
                                .padding(.horizontal, 40)
                                .padding(.vertical, 12)
                                .background(Color(#colorLiteral(red: 0.9176470588, green: 0.368627451, blue: 0.1490196078, alpha: 1)))
                                .clipShape(Capsule())
                        }
                        .alert(isPresented: $showingAlert) {
                            Alert(
                                title: Text("Symptom Logged"),
                                message: Text("Your symptom has been successfully logged."),
                                primaryButton: .default(Text("Okay")) {
                                    setToDefault()
                                },
                                secondaryButton: .default(Text("View in Diary")) {
                                    setToDefault()
                                    selectedTab = 2
                                }
                            )
                        }
                        Spacer(minLength: 60)
                    }
                    .padding()
                    .animation(.easeOut(duration: 0.16))
                    .onTapGesture {
                        self.hideKeyboard()
                    }
                }
            }
        }
    }
}


#Preview {
    AddSymptom(selectedTab: .constant(1))
}
