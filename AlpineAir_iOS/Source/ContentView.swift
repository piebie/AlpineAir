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

    var body: some View {
        AABackgroundView(showSurface: false, backgroundGradient: EliteStatusGradients.basic)
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
