//
//  Token.swift
//  DEEP-iOS
//
//  Created by 이민규 on 10/24/23.
//

import Foundation

public class Token {
    
    internal static func get(_ tokenType: TokenType) -> String? {
        return UserDefaults.standard.string(forKey: String(describing: tokenType))
    }

    internal static func save(_ tokenType: TokenType, _ value: String) {
        UserDefaults.standard.set(value, forKey: String(describing: tokenType))
    }

    internal static func remove(_ tokenType: TokenType) {
        UserDefaults.standard.removeObject(forKey: String(describing: tokenType))
    }
}

enum TokenType {
    
    case accessToken
    case refreshToken
}
