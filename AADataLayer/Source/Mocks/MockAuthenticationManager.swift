//
//  MockAuthenticationManager.swift
//  AADataLayer
//
//  Created by Pete Biencourt on 4/13/20.
//  Copyright © 2020 Microsoft. All rights reserved.
//

import Combine
import Foundation

public class MockAuthenticationManager: IAuthenticationManager {
    public var authState: CurrentValueSubject<AuthState, Never>

    public init(authState: AuthState) {
        self.authState = CurrentValueSubject(authState)
    }

    public var signIn_return_user: User?
    public var signIn_return_error: AuthError?
    public let signIn_loadingSemaphore = DispatchSemaphore(value: 0)
    public func signIn(userName: String,
                       completion: @escaping (Result<User, AuthError>) -> ()) {
        authState.value = .loggingIn

        signIn_loadingSemaphore.wait()

        if let error = signIn_return_error {
            authState.value = .loggedOut
            completion(.failure(error))
            return
        }

        let user = signIn_return_user ?? User(name: userName)

        authState.value = .loggedIn(user: user)
        completion(.success(user))
    }
}
