//
//  User.swift
//  HomeLink
//
//  Created by Pedro Andriotti on 09/09/24.
//

import Foundation

struct User: Decodable, Identifiable {
    let id: String
    let name: String
    let email: String
    let phone: String
    let amazonMail: String?
    let amazonPassword: String?
}
