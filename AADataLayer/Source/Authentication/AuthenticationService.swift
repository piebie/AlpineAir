//
//  AuthenticationService.swift
//  AADataLayer
//
//  Created by Pete Biencourt on 4/13/20.
//  Copyright © 2020 Microsoft. All rights reserved.
//

import Foundation

public class AuthenticationService: IAuthenticationService {
    private enum KnownUsers: String {
        case Annie
        case Joseph
        case Samantha
    }

    private var users = [String: Data]()

    public init() {
        users = [KnownUsers.Annie.rawValue: generateJsonData(user: .Annie),
                 KnownUsers.Joseph.rawValue: generateJsonData(user: .Joseph),
                 KnownUsers.Samantha.rawValue: generateJsonData(user: .Samantha)]
    }

    public func signIn(userName: String,
                       completion: (Result<User, AuthError>) -> ()) {
        guard let jsonData = users[userName],
            let user = try? JSONDecoder().decode(User.self, from: jsonData) else {
                completion(.failure(.unknownUser))
                return
        }

        completion(.success(user))
    }

    private func generateJsonData(user: KnownUsers) -> Data {
        let json = """
        {
            "name": "\(user.rawValue)"
        }
        """

        return json.data(using: .utf8)!
    }
}
