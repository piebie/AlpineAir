//
//  AuthenticationManager.swift
//  AADataLayer
//
//  Created by Pete Biencourt on 4/13/20.
//  Copyright © 2020 Microsoft. All rights reserved.
//

import Combine
import Foundation

public class AuthenticationManager: IAuthenticationManager {
    public private(set) var authState: CurrentValueSubject<AuthState, Never>

    private let authenticationService: IAuthenticationService

    public init(authenticationService: IAuthenticationService) {
        self.authenticationService = authenticationService
        self.authState = CurrentValueSubject(.loggedOut)
    }

    public func signIn(userName: String,
                       completion: @escaping (Result<User, AuthError>) -> ()) {
        authState.value = .loggingIn
        authenticationService.signIn(userName: userName) { [weak self] result in
            guard let self = self else {
                return
            }

            defer { completion(result) }

            guard let user = try? result.get() else {
                self.authState.value = .loggedOut
                return
            }

            self.authState.value = .loggedIn(user: user)
        }
    }
}
