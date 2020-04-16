//
//  SignInTextField.swift
//  AASharedUI
//
//  Created by Pete Biencourt on 4/16/20.
//  Copyright © 2020 Microsoft. All rights reserved.
//

import Foundation
import SwiftUI

struct SignInTextField: TextFieldStyle {
    public let image: Image?
    public let placeholderText: String
    public let showPlaceholder: Bool

    public init(image: Image? = nil,
                placeholderText: String,
                showPlaceholder: Bool) {
        self.image = image
        self.placeholderText = placeholderText
        self.showPlaceholder = showPlaceholder
    }

    func _body(configuration: TextField<_Label>) -> some View {
        HStack {
            image.animation(nil)
            ZStack(alignment: .leading) {
                if showPlaceholder {
                    Text(placeholderText)
                }
                configuration
                    .foregroundColor(InterfaceColors.primaryLabel)
            }.animation(nil)
        }
        .padding(8)
        .background(InterfaceColors.primaryBackground.opacity(0.8))
        .foregroundColor(showPlaceholder ? InterfaceColors.secondaryLabel : InterfaceColors.primaryLabel)
        .cornerRadius(8)
        .overlay(RoundedRectangle(cornerRadius: 8).stroke(InterfaceColors.gray3, lineWidth: 1))
        .padding(1)
    }
}
