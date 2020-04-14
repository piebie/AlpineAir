//
//  ContentView.swift
//  AlpineAir_iOS
//
//  Created by Pete Biencourt on 4/13/20.
//  Copyright © 2020 Microsoft. All rights reserved.
//

import AADataLayer
import AAViewModels
import AASharedUI
import SwiftUI

struct ContentView: View {
    @ObservedObject var appStateModel: AppStateModel

    @State var isLoggedIn = false

    var body: some View {
        // TODO: Week 2 tasks
        // 1. Create a landing page view which has:
        //     * A title label for "Alpine Air"
        //     * A wrapping, subtitle label saying "From chairlifts to airplanes, you can trust us with your travel"
        //     * An AALoginView (see the file in AASharedUI/Source/Views) - its action should toggle the isLoggedIn binding
        //     * Automatic spacing between the top of the page and the title + subtitle group, and the bottom of the page and the bottom of the login block
        // 2. A "Sign Out" button that shows only when the surface is shown - its action should toggle the isLoggedIn binding
        AABackgroundView(showSurface: isLoggedIn, backgroundGradient: EliteStatusGradients.basic)
    }
}

struct ContentView_Previews: PreviewProvider {
    static let appStateModel = AppStateModel(authenticationManager: MockAuthenticationManager(authState: .loggedOut))

    static var previews: some View {
        Group {
            ContentView(appStateModel: appStateModel)

            ContentView(appStateModel: appStateModel).colorScheme(.dark)
        }
    }
}
