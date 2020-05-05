//
//  AALoginView.swift
//  AASharedUI
//
//  Created by Pete Biencourt on 4/14/20.
//  Copyright © 2020 Microsoft. All rights reserved.
//

import Foundation
import SwiftUI

public struct AALoginView: View {
    @State var username: String = ""
    @State var password: String = ""

    let loginAction: (String, String) -> ()

    public init(loginAction: @escaping (String, String) -> ()) {
        self.loginAction = loginAction
    }

    public var body: some View {
        ZStack(alignment: .top) {
            InterfaceColors.primaryBackground
                .opacity(0.8)

            VStack {
                TextField("Username", text: $username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                Button(action: { self.loginAction(self.username, self.password) }) {
                    Text("Sign in")
                }
            }.padding()
            }
        .cornerRadius(8)
        .fixedSize(horizontal: false,
                    vertical: true)
    }
}

public struct AALoginView_Previews: PreviewProvider {
    public static var previews: some View {
        Group {
            PreviewWrapper().colorScheme(.light)
            PreviewWrapper().colorScheme(.dark)
        }
    }

    struct PreviewWrapper: View {
        var body: some View {
            ZStack {
                AABackgroundView(showSurface: false, backgroundGradient: EliteStatusGradients.basic)

                AALoginView(loginAction: { _, _ in })
                    .frame(width: 300)
                    .shadow(radius: 10)
            }
        }
    }
}
