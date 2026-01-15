//
//  Custom Slider.swift
//  Delailah Views
//
//  Created by Kane Denzil Quadras Bernard on 2024-10-08.
//

import SwiftUI

struct CustomSlider: View {
    @Binding var value: Double
    var range: ClosedRange<Double>
    var onValueChanged: ((Double) -> Void)?
    let segmentedValues: [Double] = [5, 33, 63, 92]
    let segmentLabels: [String] = ["OFF", "LOW", "MEDIUM", "HIGH"]
    
    private let trackHeight: CGFloat = 15
    private let thumbWidth: CGFloat = 40
    private let segmentSpacingPercentage: CGFloat = 0.01
    var colors: [Color] = [
        Color(UIColor.lightGray),
        .yellow,
        .orange,
        .red
    ]
    
    var body: some View {
        VStack {
            GeometryReader { geometry in
                self.labelsView(geometry: geometry)
            }
            .frame(height: 20)

            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    self.coloredTrackWithCustomWidths(geometry: geometry)
                    
                    Circle()
                        .strokeBorder(self.thumbOutlineColor(for: self.value), lineWidth: 2)
                        .background(Circle().foregroundColor(.white))
                        .frame(width: thumbWidth, height: thumbWidth)
                        .shadow(radius: 3)
                        .offset(x: self.thumbPosition(for: self.value, in: geometry.size.width) - thumbWidth / 2, y: 0)
                        .gesture(
                                DragGesture()
                                    .onChanged({ value in
                                        let newValue = self.value(for: value.location.x, width: geometry.size.width)
                                        let snappedValue = self.snapToSegmentedValue(newValue)
                                        if self.value != snappedValue {
                                            self.value = snappedValue
                                            self.onValueChanged?(self.value)
                                        }
                                    })
                            )
                }
            }
            .frame(height: trackHeight)
        }
    }
    
    private func labelsView(geometry: GeometryProxy) -> some View {
        let closestSegmentIndex = self.closestSegmentIndex(for: self.value)
        return  ZStack(alignment: .leading) {
            ForEach(Array(segmentLabels.enumerated()), id: \.offset) { index, label in
                Text(label)
                    .font(.caption)
                    .fontWeight(index == closestSegmentIndex ? .bold : .regular)
                    .lineLimit(1)
                    .frame(width: self.segmentWidth(forIndex: index, in: geometry.size.width), height: 20, alignment: .center)
                    .offset(x: self.labelOffset(forIndex: index, in: geometry.size.width), y: 0)
            }
        }
    }
    
    private func segmentWidth(forIndex index: Int, in totalWidth: CGFloat) -> CGFloat {
        let totalSpacing = segmentSpacingPercentage * totalWidth * CGFloat(colors.count)
        let availableWidth = totalWidth - thumbWidth - totalSpacing
        let segmentWidth = availableWidth / CGFloat(segmentedValues.count)
        return segmentWidth
    }
    
    private func labelOffset(forIndex index: Int, in totalWidth: CGFloat) -> CGFloat {
        let segmentWidth = self.segmentWidth(forIndex: index, in: totalWidth)
        _ = segmentSpacingPercentage * totalWidth * CGFloat(colors.count - 1)
        let spacingBeforeSegment = CGFloat(index) * segmentSpacingPercentage * totalWidth
        let offset = (segmentWidth + spacingBeforeSegment) * CGFloat(index) + (thumbWidth / 2)
        if index == 0 {
                return offset - 20
        } else {
            return offset - (segmentWidth / 6)
        }
    }
    
    private func snapToSegmentedValue(_ value: Double) -> Double {
        let closestValue = segmentedValues.min(by: { abs($0 - value) < abs($1 - value) })
        return closestValue ?? value
    }
    
    private func closestSegmentIndex(for value: Double) -> Int {
        guard let closestValue = segmentedValues.min(by: { abs($0 - value) < abs($1 - value) }) else { return 0 }
        return segmentedValues.firstIndex(of: closestValue) ?? 0
    }
    
    private func coloredTrackWithCustomWidths(geometry: GeometryProxy) -> some View {
        let totalSpacing = segmentSpacingPercentage * geometry.size.width * CGFloat(colors.count - 1)
        let availableWidth = geometry.size.width - thumbWidth - totalSpacing
        let firstSegmentWidth = availableWidth * 0.25
        let otherSegmentWidth = availableWidth * 0.29
        
        return HStack(spacing: geometry.size.width * segmentSpacingPercentage) {
            colors[0]
                .frame(width: firstSegmentWidth, height: trackHeight)
            ForEach(1..<colors.count) { index in
                colors[index]
                    .frame(width: otherSegmentWidth, height: trackHeight)
            }
        }
    }
    
    private func thumbPosition(for value: Double, in width: CGFloat) -> CGFloat {
        let segmentsTotalWidth = width - thumbWidth
        let stepPercentage = CGFloat((value - range.lowerBound) / (range.upperBound - range.lowerBound))
        return stepPercentage * segmentsTotalWidth + thumbWidth / 2
    }
    
    private func value(for locationX: CGFloat, width: CGFloat) -> Double {
        let adjustedLocationX = max(min(locationX, width - thumbWidth / 2), thumbWidth / 2)
        let percentage = (adjustedLocationX - thumbWidth / 2) / (width - thumbWidth)
        let value = Double(percentage) * (range.upperBound - range.lowerBound) + range.lowerBound
        return min(max(value, range.lowerBound), range.upperBound)
    }
    
    private func thumbOutlineColor(for value: Double) -> Color {
        guard let closestValue = segmentedValues.min(by: { abs($0 - value) < abs($1 - value) }) else { return .gray }
        let segmentIndex = segmentedValues.firstIndex(of: closestValue) ?? 0
        return colors[min(segmentIndex, colors.count - 1)]
    }
}

struct CustomSliderWrapperView: View {
    @State private var sliderValue: Double = 7
    var body: some View {
        CustomSlider(value: $sliderValue, range: 0...100)
            .padding()
    }
}

struct CustomSlider_Previews: PreviewProvider {
    static var previews: some View {
        CustomSliderWrapperView()
    }
}
