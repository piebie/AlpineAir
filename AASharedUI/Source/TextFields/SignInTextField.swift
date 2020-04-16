//
//  SignInTextField.swift
//  AASharedUI
//
//  Created by Pete Biencourt on 4/16/20.
//  Copyright © 2020 Microsoft. All rights reserved.
//

import Foundation
import SwiftUI

// TODO: WEEK 4
// Create a SignTextField which implements TextFieldStyle
// This should:
//  1. Allow the caller to place an image next to the text
//  2. Provide a mechanism to replace the default placeholder text implementation.
//      So far, Apple has not provided an API to change the placeholder text color on a TextField,
//      so we'll need to roll our own.
//  3. Draw a single border around both the image and text of InterfaceColors.gray3
//  4. Provide a background of .primaryBackground at 0.8 opacity
//  5. The whole view should have a corner radius of 8 - make sure the border isn't cut off!
struct SignInTextField: TextFieldStyle {

    func _body(configuration: TextField<_Label>) -> some View {
                configuration
    }
}
