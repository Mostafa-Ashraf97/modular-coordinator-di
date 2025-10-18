//
//  LoginViewModel.swift
//  Coordinator
//

import Foundation
import Combine

protocol LoginViewModelProtocol: ObservableObject {
    var isLoading: Bool { get set }
    var showError: Bool { get set }
    var errorMessage: String { get set }
    
    func performLogin()
    func navigateToForgotPassword()
    func navigateToRegister()
}

final class LoginViewModel: LoginViewModelProtocol {
    
    @Published var isLoading: Bool = false
    @Published var showError: Bool = false
    @Published var errorMessage: String = ""
    
    private weak var coordinator: LoginCoordinatorActions?
    private let interactor: LoginInteractorProtocol
    private var tasks: [Task<Void, Never>] = []
    
    init(coordinator: LoginCoordinatorActions, interactor: LoginInteractorProtocol) {
        self.coordinator = coordinator
        self.interactor = interactor
    }
    
    @MainActor
    func performLogin() {
        let task = Task {
            isLoading = true
            do {
                let user = try await interactor.performLogin()
                isLoading = false
                coordinator?.loginSuccess(user: user)
            } catch {
                isLoading = false
                errorMessage = error.localizedDescription
                showError = true
            }
        }
        tasks.append(task)
    }
    
    func navigateToForgotPassword() {
        coordinator?.navigateToForgotPassword()
    }
    
    func navigateToRegister() {
        coordinator?.navigateToRegister()
    }
    
    deinit {
        tasks.forEach { $0.cancel() }
    }
}
