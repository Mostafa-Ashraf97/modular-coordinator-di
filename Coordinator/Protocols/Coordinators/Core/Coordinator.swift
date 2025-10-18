//
//  Coordinator.swift
//  CleanCoordinatorApp
//


protocol Coordinator: AnyObject {
    var router: Router { get }
    func start()
}

