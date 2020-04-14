//
//  CustomAnimations.swift
//  AASharedUI
//
//  Created by Pete Biencourt on 4/14/20.
//  Copyright © 2020 Microsoft. All rights reserved.
//

import Foundation
import SwiftUI

public extension Animation {
    static func ripple(index: Int) -> Animation {
        Animation.spring(dampingFraction: 0.8)
            .delay(0.25 * Double(index))
    }
}
