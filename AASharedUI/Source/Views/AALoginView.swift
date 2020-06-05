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
    private let itemTransition = AnyTransition.asymmetric(insertion: AnyTransition.offset(x: 100, y: 0).combined(with: .move(edge: .trailing)),
                                                          removal: AnyTransition.opacity.combined(with: .move(edge: .trailing)))

    @State var username: String = ""
    @State var password: String = ""

    @State var hasLoaded = false

    let loginAction: (String, String) -> ()
    public let isHidden: Binding<Bool>

    public init(loginAction: @escaping (String, String) -> (),
                isHidden: Binding<Bool>) {
        self.loginAction = loginAction
        self.isHidden = isHidden
    }

    public var body: some View {
        VStack(spacing: 10) {
            if hasLoaded && !isHidden.wrappedValue {
                Spacer()

                Text("Alpine Air")
                    .font(.system(size: 60, weight: .thin))
                    .foregroundColor(FlatUIColors.clouds)
                    .padding(.bottom, 10)
                    .frame(maxWidth: 300)
                    .transition(itemTransition)
                    .animation(.ripple(index: 0))

                Text("From chairlifts to airplanes, you can trust us with your travel")
                    .font(.system(size: 20, weight: .light))
                    .foregroundColor(FlatUIColors.clouds)
                    .multilineTextAlignment(.center)
                    .transition(itemTransition)
                    .animation(.ripple(index: 1))

                Spacer()

                TextField("Username", text: $username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .transition(itemTransition)
                    .animation(.ripple(index: 2))

                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .transition(itemTransition)
                    .animation(.ripple(index: 3))

                Spacer()

                Button(action: { self.loginAction(self.username, self.password) }) {
                    Text("Sign in")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(SpotlightButtonStyle(background: InterfaceColors.navy,
                                                  foregroundColor: FlatUIColors.clouds,
                                                  font: .system(size: 20, weight: .regular)))
                .transition(itemTransition)
                .animation(.ripple(index: 4))
            }

            Spacer()
        }.onAppear() {
            withAnimation {
                self.hasLoaded = true
            }
        }
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
        @State var isHidden: Bool = true

        var body: some View {
            ZStack(alignment: .top) {
                AABackgroundView(showSurface: false, backgroundGradient: EliteStatusGradients.basic)
                    .zIndex(0)

                AALoginView(loginAction: { _, _ in },
                            isHidden: self.$isHidden)
                    .frame(maxWidth: 300)
                    .shadow(radius: 10)
                    .zIndex(1)

                Toggle(isOn: self.$isHidden.animation()) {
                    Text("boop")
                }
            .zIndex(2)
            }
        }
    }
}
