//
//  User.swift
//  MVC
//
//  Created by Emre Eraslan on 14.07.2023.
//

import Foundation

struct User {
    let name, username: String
    let age: Int
    let address: Address
}

struct Address {
    let city: String
    let country : String
}
