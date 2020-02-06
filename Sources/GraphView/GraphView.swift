//
//  GraphView.swift
//  GraphViewTest
//
//  Created by Christopher Moore on 2/5/20.
//  Copyright © 2020 Roving Mobile. All rights reserved.
//

import SwiftUI

public struct GraphView: View {
    var values: [CGFloat]

    var tint: Color = .blue

    let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 1
        formatter.minimumFractionDigits = 1
        return formatter
    }()

    public init(values: [CGFloat]) {
        self.values = values
    }

    public var body: some View {
        HStack(alignment: .bottom, spacing: 30) {
            ForEach(values, id: \.self) { value in
                VStack {
                    GeometryReader { geo in
                        ZStack(alignment: .bottom) {
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color(.secondarySystemFill))
                            if value > CGFloat.zero {
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(self.tint)
                                    .frame(height: geo.size.height * value)
                            }
                        }
                    }
                    Text(self.display(for: value))
                        .font(.caption)
                }
            }
        }
    }

    func display(for value: CGFloat) -> String {
        formatter.string(for: value) ?? ""
    }
}

struct GraphView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self) { colorScheme in
            VStack {
                GraphView(values: [0.9, 0.7, 0.4, 0.2, 0.8, 0.6, 0.5])
                    .padding()
                    .background(Color(.systemBackground))
            }
            .environment(\.colorScheme, colorScheme)
            .previewDisplayName("\(colorScheme)")
        }
        .frame(height: 300)
        .previewLayout(.sizeThatFits)
    }
}
