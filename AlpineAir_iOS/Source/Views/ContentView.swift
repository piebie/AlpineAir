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
        ZStack(alignment: .top) {
            AABackgroundView(showSurface: isLoggedIn, backgroundGradient: EliteStatusGradients.basic).zIndex(0)

            AALoginView(loginAction: { _,_ in
                withAnimation {
                    self.isLoggedIn.toggle()
                }
            },
                        isHidden: self.$isLoggedIn)
                .frame(maxWidth: 300)

            if isLoggedIn {
                HStack(alignment: .center) {
                    Button(action: { self.isLoggedIn.toggle() }) {
                        Text("Sign out")
                    }
                }.frame(maxHeight: .infinity)
            }
        }
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
