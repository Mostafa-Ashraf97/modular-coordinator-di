//
//  HomeInteractor.swift
//  Coordinator
//

import Common
import Foundation

protocol HomeInteractorProtocol {
    func loadHomeData() async throws
}

final class HomeInteractor: HomeInteractorProtocol {
    init() {}

    func loadHomeData() async throws {
        // Add logic to load home data
    }
}
