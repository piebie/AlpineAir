//
//  RidgeLine.swift
//  AASharedUI
//
//  Created by Pete Biencourt on 4/14/20.
//  Copyright © 2020 Microsoft. All rights reserved.
//

import Foundation
import SwiftUI

struct RidgeLine: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        let xRange = rect.minX + rect.maxX
        let yRange = rect.minY + rect.maxY

        path.move(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.midY))
        path.addLine(to: CGPoint(x: 0.125 * xRange, y: 0.25 * yRange))
        path.addLine(to: CGPoint(x: 0.25 * xRange, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: 0.75 * xRange, y: rect.midY))
        path.addLine(to: CGPoint(x: 0.875 * xRange, y: 0.25 * yRange))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))

        return path
    }
}
