//
//  User.swift
//  Coordinator
//

public struct User {
    public var firstName: String?
    public var lastName: String?
    public var gender: GenderType?
    public var height: Int?
    public var weight: Int?
    public var goals: [String]?
    
    public init() {}
}

public enum GenderType: String {
    case male
    case female
    case other
}
