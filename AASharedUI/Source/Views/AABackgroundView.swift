//
//  AABackgroundView.swift
//  AASharedUI
//
//  Created by Pete Biencourt on 4/14/20.
//  Copyright © 2020 Microsoft. All rights reserved.
//

import Foundation
import SwiftUI

public struct AABackgroundView: View {
    public var showSurface: Bool
    public let backgroundGradient: Gradient

    public init(showSurface: Bool,
                backgroundGradient: Gradient) {
        self.showSurface = showSurface
        self.backgroundGradient = backgroundGradient
    }

    public var body: some View {
        ZStack {
            LinearGradient(gradient: backgroundGradient, startPoint: .topLeading, endPoint: .bottomTrailing)

            if showSurface {
                RidgeLineBackgroundSurface(surfaceColor: InterfaceColors.primaryBackground)
                    .padding(.top, 150)
                    .shadow(radius: 10)
            }
        }.edgesIgnoringSafeArea(.all)
    }
}

struct AABackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PreviewWrapper(backgroundGradient: EliteStatusGradients.basic).colorScheme(.light)
            PreviewWrapper(backgroundGradient: EliteStatusGradients.basic).colorScheme(.dark)
        }
    }

    struct PreviewWrapper: View {
        @State var showSurface = false
        @State var backgroundGradient: Gradient

        var body: some View {
            ZStack {
                AABackgroundView(showSurface: showSurface, backgroundGradient: backgroundGradient)

                Button(action: {
                    withAnimation { self.showSurface.toggle()
                        self.backgroundGradient = self.showSurface ? EliteStatusGradients.sapphire : EliteStatusGradients.basic
                    }
                }) {
                    Text("Show/Hide surface")
                }
            }
        }
    }
}
