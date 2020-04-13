//
//  AuthError.swift
//  AADataLayer
//
//  Created by Pete Biencourt on 4/13/20.
//  Copyright © 2020 Microsoft. All rights reserved.
//

import Foundation

public enum AuthError: Error {
    case unknownUser
    case noInternet
}
