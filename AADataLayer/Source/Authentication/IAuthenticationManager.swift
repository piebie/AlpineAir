//
//  IAuthenticationManager.swift
//  AADataLayer
//
//  Created by Pete Biencourt on 4/13/20.
//  Copyright © 2020 Microsoft. All rights reserved.
//

import Combine
import Foundation

public protocol IAuthenticationManager: AnyObject {
    var authState: CurrentValueSubject<AuthState, Never> { get }

    func signIn(userName: String,
                completion: @escaping (Result<User, AuthError>) -> ())
}
