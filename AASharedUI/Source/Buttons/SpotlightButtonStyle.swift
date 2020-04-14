//
//  SpotlightButtonStyle.swift
//  AASharedUI
//
//  Created by Pete Biencourt on 4/14/20.
//  Copyright © 2020 Microsoft. All rights reserved.
//

import Foundation
import SwiftUI

// TODO: WEEK 3
// 1. Implement this button style. It should take the following as arguments:
//      * background: some View
//      * foregroundColor: Color
//    It should also provide ways to modify the following:
//      * font
//      * horizontal padding between the label and edges of the button
//      * vertical padding between the label and the edges of the button
//      * corner radius of the button

public struct SpotlightButtonStyle<Background>: ButtonStyle where Background: View {
    private let background: Background
    private let foregroundColor: Color

    public init(background: Background,
                foregroundColor: Color) {
        self.background = background
        self.foregroundColor = foregroundColor
    }

    public func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
    }
}
