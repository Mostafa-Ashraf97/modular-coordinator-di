//
//  User.swift
//  CleanCoordinatorApp
//

struct User {
    var firstName: String?
    var lastName: String?
    var gender: GenderType?
    var height: Int?
    var weight: Int?
    var goals: [String]?
}

enum GenderType: String {
    case male
    case female
    case other
}

