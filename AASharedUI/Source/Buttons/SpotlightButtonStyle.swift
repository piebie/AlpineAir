//
//  SpotlightButtonStyle.swift
//  AASharedUI
//
//  Created by Pete Biencourt on 4/14/20.
//  Copyright © 2020 Microsoft. All rights reserved.
//

import Foundation
import SwiftUI

public struct SpotlightButtonStyle<Background>: ButtonStyle where Background: View {
    private let background: Background
    private let foregroundColor: Color
    private let font: Font
    private let horizontalPadding: CGFloat
    private let verticalPadding: CGFloat
    private let cornerRadius: CGFloat

    public init(background: Background,
                foregroundColor: Color,
                font: Font = .system(size: 35, weight: .medium),
                horizontalPadding: CGFloat = 32,
                verticalPadding: CGFloat = 8,
                cornerRadius: CGFloat = 8) {
        self.background = background
        self.foregroundColor = foregroundColor
        self.font = font
        self.horizontalPadding = horizontalPadding
        self.verticalPadding = verticalPadding
        self.cornerRadius = cornerRadius
    }

    public func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .font(font)
            .padding(.horizontal, horizontalPadding)
            .padding(.vertical, verticalPadding)
            .background(background)
            .cornerRadius(cornerRadius)
            .foregroundColor(foregroundColor)
    }
}

