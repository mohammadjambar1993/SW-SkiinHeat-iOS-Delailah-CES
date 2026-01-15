//
//  FlowLayout.swift
//  SkiinHeat
//
//  Created by Kane Denzil Quadras Bernard on 2025-01-02.
//  Copyright © 2025 Myant. All rights reserved.
//

import SwiftUI

struct FlowLayout<Item, ItemID, Content>: View
where Item: Hashable, ItemID: Hashable, Content: View {
    var items: [Item]
    var id: KeyPath<Item, ItemID>
    var content: (Item) -> Content

    @State private var totalHeight = CGFloat.zero

    var body: some View {
        GeometryReader { geometry in
            self.content(in: geometry)
        }
    }

    private func content(in geometry: GeometryProxy) -> some View {
        var width = CGFloat.zero
        var height = CGFloat.zero
        var lastHeight = CGFloat.zero

        return ZStack(alignment: .topLeading) {
            ForEach(items, id: id) { item in
                self.content(item)
                    .padding([.horizontal, .vertical], 4)
                    .alignmentGuide(
                        .leading,
                        computeValue: { d in
                            if abs(width - d.width) > geometry.size.width {
                                width = 0
                                height -= lastHeight
                            }
                            let result = width
                            if item == items.last {
                                width = 0
                            } else {
                                width -= d.width
                            }
                            return result
                        }
                    )
                    .alignmentGuide(
                        .top,
                        computeValue: { d in
                            let result = height
                            if item == items.last {
                                height = 0
                            } else {
                                lastHeight = d.height
                            }
                            return result
                        })
            }
        }
        .background(viewHeightReader($totalHeight))
    }

    private func viewHeightReader(_ binding: Binding<CGFloat>) -> some View {
        return GeometryReader { geometry -> Color in
            let height = geometry.frame(in: .local).size.height
            DispatchQueue.main.async {
                binding.wrappedValue = height
            }
            return .clear
        }
    }
}
