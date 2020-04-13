//
//  EliteStatusGradients.swift
//  AASharedUI
//
//  Created by Pete Biencourt on 4/14/20.
//  Copyright © 2020 Microsoft. All rights reserved.
//

import Foundation
import SwiftUI

public enum EliteStatusGradients {
    public static var basic: Gradient {
        Gradient(colors: [InterfaceColors.basicGradientStart, InterfaceColors.basicGradientMid, InterfaceColors.basicGradientEnd])
    }

    public static var emerald: Gradient {
        Gradient(colors: [InterfaceColors.emeraldGradientStart, InterfaceColors.emeraldGradientEnd, InterfaceColors.emeraldGradientStart])
    }

    public static var sapphire: Gradient {
        Gradient(colors: [InterfaceColors.sapphireGradientStart, InterfaceColors.sapphireGradientEnd, InterfaceColors.sapphireGradientStart])
    }

    public static var blackDiamond: Gradient {
        Gradient(colors: [InterfaceColors.blackDiamondGradientStart, InterfaceColors.blackDiamondGradientEnd, InterfaceColors.blackDiamondGradientStart])
    }
}
