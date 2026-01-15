//
//  SearchSymptom.swift
//  SkiinHeat
//
//  Created by Kane Denzil Quadras Bernard on 2024-12-09.
//  Copyright © 2024 Myant. All rights reserved.
//

import SwiftUI
struct SearchSymptom: View {

    @Binding var items: [String]
    @Binding var selectedItems: Set<String>
    @State private var searchText = ""
    @State private var isEditing = false

    var body: some View {
        VStack(alignment: .leading) {
            Text("Symptom Name")
              .font(
                Font.custom("Mulish", size: 16)
                  .weight(.semibold)
              )
              .foregroundColor(Color(red: 0.2, green: 0.2, blue: 0.2))
              .frame(width: 126, height: 23, alignment: .leading)
            SearchBar(
                text: $searchText,
                onAdd: {
                    addItem()
                }
            )
            ScrollView {
                FlowLayout(items: filteredItems.sorted(), id: \.self) { item in
                    Button(action: {
                        toggleSelection(for: item)
                    }) {
                        HStack {
                            Text(item)
                                .font(Font.custom("Mulish", size: 16))
                                .multilineTextAlignment(.center)
                                .foregroundColor(
                                    selectedItems.contains(item)
                                        ? .white : Color(hex: "#A9321A"))
                        }
                        .padding(.horizontal, 15)
                        .padding(.vertical, 10)
                        .background(
                            selectedItems.contains(item)
                                ? Color(hex: "#A9321A")
                                : Color(hex: "#FFEFED")
                        )
                        .cornerRadius(15)
                    }
                }
            }

        }
    }

    var filteredItems: [String] {
        if searchText.isEmpty {
            return items
        } else {
            return items.filter {
                $0.localizedCaseInsensitiveContains(searchText)
            }
        }
    }

    func searchItems() {
    }

    func addItem() {
        items.append(searchText)
        toggleSelection(for: searchText)
        print("Current Item", selectedItems)
    }

    func toggleSelection(for item: String) {
        print("Before toggling:", selectedItems)
        if selectedItems.contains(item) {
            selectedItems.remove(item)
        } else {
            selectedItems.insert(item)
        }
        print("After toggling:", selectedItems)
    }

    func clearSelection() {
        selectedItems.removeAll()
    }
}

