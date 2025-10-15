//
//  HomepageInteractor.swift
//  MyCoordinatorPattern
//

import Foundation

protocol HomepageInteractorProtocol {
    func loadHomepageData() async throws
}

final class HomepageInteractor: HomepageInteractorProtocol {
    
    func loadHomepageData() async throws {
        // Add logic to load homepage data
    }
}
