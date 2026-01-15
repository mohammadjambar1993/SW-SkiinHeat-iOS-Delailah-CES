//
//  SearchBar.swift
//  SkiinHeat
//
//  Created by Kane Denzil Quadras Bernard on 2024-12-09.
//  Copyright © 2024 Myant. All rights reserved.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    var onCommit: () -> Void = {}
    var onAdd: () -> Void

    var body: some View {
        HStack(spacing: 0) {
            TextField("Search or add symptom", text: $text)
                .padding()
                .padding(.horizontal, 30)
                .background(Color(.systemGray6))
                .font(Font.custom("Mulish", size: 16))
                .foregroundColor(Color(red: 0.41, green: 0.44, blue: 0.46))
                .clipShape(RoundedCorners(tl: 20, tr: 0, bl: 20, br: 0))
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .frame(
                                minWidth: 0, maxWidth: .infinity,
                                alignment: .leading
                            )
                            .padding(.leading, 8)
                            .foregroundColor(Color(hex: "#033761"))
                            .font(Font.system(size: 25))

                        if !text.isEmpty {
                            Button(action: {
                                self.text = ""
                            }) {
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 8)
                            }
                        }
                    }
                )
                .overlay(
                    RoundedCorners(tl: 20, tr: 0, bl: 20, br: 0)
                        .stroke(
                            Color(hex: text.count == 0 ? "#D1D1D1" : "#A9321A"),
                            lineWidth: 2)
                )

            HStack {
                Button(action: {
                    onAdd()
                }) {
                    HStack {
                        Image(systemName: "plus")
                        Text("ADD")
                    }
                    .font(
                        Font.custom("Mulish", size: 16)
                            .weight(.semibold)
                    )
                    .foregroundColor(.white)
                    .padding(19)
                    .background(
                        Color(hex: text.count == 0 ? "#D1D1D1" : "#A9321A")
                    )
                    .clipShape(RoundedCorners(tl: 0, tr: 20, bl: 0, br: 20))
                }
            }

        }
    }
}

#Preview {
    SearchBar(text: .constant(""), onAdd: add)
}

func add() {

}

struct RoundedCorners: Shape {
    var tl: CGFloat = 0.0
    var tr: CGFloat = 0.0
    var bl: CGFloat = 0.0
    var br: CGFloat = 0.0

    func path(in rect: CGRect) -> Path {
        var path = Path()

        let w = rect.size.width
        let h = rect.size.height
        // Make sure we do not exceed the size of the rectangle
        let tr = min(min(self.tr, h / 2), w / 2)
        let tl = min(min(self.tl, h / 2), w / 2)
        let bl = min(min(self.bl, h / 2), w / 2)
        let br = min(min(self.br, h / 2), w / 2)

        path.move(to: CGPoint(x: w / 2.0, y: 0))
        path.addLine(to: CGPoint(x: w - tr, y: 0))
        path.addArc(
            center: CGPoint(x: w - tr, y: tr), radius: tr,
            startAngle: Angle(degrees: -90), endAngle: Angle(degrees: 0),
            clockwise: false)
        path.addLine(to: CGPoint(x: w, y: h - br))
        path.addArc(
            center: CGPoint(x: w - br, y: h - br), radius: br,
            startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 90),
            clockwise: false)
        path.addLine(to: CGPoint(x: bl, y: h))
        path.addArc(
            center: CGPoint(x: bl, y: h - bl), radius: bl,
            startAngle: Angle(degrees: 90), endAngle: Angle(degrees: 180),
            clockwise: false)
        path.addLine(to: CGPoint(x: 0, y: tl))
        path.addArc(
            center: CGPoint(x: tl, y: tl), radius: tl,
            startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 270),
            clockwise: false)
        path.closeSubpath()

        return path
    }
}
