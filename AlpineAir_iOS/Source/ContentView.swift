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
        ZStack {
            AABackgroundView(showSurface: isLoggedIn, backgroundGradient: EliteStatusGradients.basic)

            if !isLoggedIn {
                VStack {
                    Spacer()

                    Text("Alpine Air")
                        .font(.system(size: 60, weight: .thin))
                        .foregroundColor(InterfaceColors.primaryBackground)
                        .padding(.bottom, 10)
                    Text("From chairlifts to airplanes, you can trust us with your travel")
                        .font(.system(size: 20, weight: .light))
                        .foregroundColor(InterfaceColors.primaryBackground)
                        .multilineTextAlignment(.center)

                    Spacer()

                    AALoginView(loginAction: { _, _ in self.isLoggedIn.toggle() })
                        .shadow(radius: 10)

                    Spacer()
                    Spacer()

                }.frame(maxWidth: 300)
            } else {
                Button(action: { self.isLoggedIn.toggle() }) {
                    Text("Sign out")
                }
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
