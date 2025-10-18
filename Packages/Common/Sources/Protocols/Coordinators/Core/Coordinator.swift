//
//  Coordinator.swift
//  Coordinator
//

public protocol Coordinator: AnyObject {
    var router: Router { get }

    func start()
}
