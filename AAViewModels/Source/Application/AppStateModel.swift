//
//  AppStateModel.swift
//  AAViewModels
//
//  Created by Pete Biencourt on 4/13/20.
//  Copyright © 2020 Microsoft. All rights reserved.
//

import AADataLayer
import Combine
import Foundation

public class AppStateModel: ObservableObject {
    public enum State {
        case loggedOut
        case loading
        case loggedIn
    }

    @Published public private(set) var state = State.loggedOut
    public private(set) var signedInUser: User?

    private var authStateSubscription: AnyCancellable?
    private let authenticationManager: IAuthenticationManager

    public init(authenticationManager: IAuthenticationManager) {
        self.authenticationManager = authenticationManager

        authStateSubscription = authenticationManager.authState.sink { authState in
            switch authState {
            case .loggedOut:
                self.signedInUser = nil
                self.state = .loggedOut

            case .loggingIn:
                self.signedInUser = nil
                self.state = .loading

            case .loggedIn(let user):
                self.signedInUser = user
                self.state = .loggedIn
            }
        }
    }

    public func signIn(userName: String) {
        authenticationManager.signIn(userName: userName) { result in }
    }
}
