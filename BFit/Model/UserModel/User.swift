//
//  User.swift
//  BFit
//
//  Created by Ben Do on 11/10/25.
//

struct User {
    var firstName: String
    var lastName: String
    var email: String
    var age: Int
    var height: Double
    var weight: Double
    var gender: Gender
}

enum Gender: String, CaseIterable {
    case male = "male"
    case female = "female"
}
