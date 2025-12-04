//
//  User.swift
//  BFit
//
//  Created by Ben Do on 11/10/25.
//

struct User {
    var age: Int
    var height: Double
    var weight: Double
    var gender: Gender
}

struct NavySealUser {
    var height: Double
    var waist: Double
    var neck: Double
    var gender: Gender
    var hip: Double
}

enum Gender: String, CaseIterable {
    case male = "male"
    case female = "female"
}
