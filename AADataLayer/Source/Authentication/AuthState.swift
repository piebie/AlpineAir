//
//  AuthState.swift
//  AADataLayer
//
//  Created by Pete Biencourt on 4/13/20.
//  Copyright © 2020 Microsoft. All rights reserved.
//

import Foundation

public enum AuthState {
    case loggedOut
    case loggingIn
    case loggedIn(user: User)
}
