//
//  RidgeLineBackgroundSurface.swift
//  AASharedUI
//
//  Created by Pete Biencourt on 4/14/20.
//  Copyright © 2020 Microsoft. All rights reserved.
//

import Foundation
import SwiftUI

struct RidgeLineBackgroundSurface: View {
    let surfaceColor: Color

    var body: some View {
        VStack(spacing: 0) {
            RidgeLine()
                .fill(surfaceColor)
                .frame(height: 200)
            surfaceColor
        }.clipped()
    }
}
