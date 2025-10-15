//
//  ForgotPasswordViewModel.swift
//  MyCoordinatorPattern
//

import Foundation
import Combine

protocol ForgotPasswordViewModelProtocol: ObservableObject {
    var isLoading: Bool { get set }
    var showError: Bool { get set }
    var showSuccess: Bool { get set }
    var errorMessage: String { get set }
    
    func sendResetPassword()
    func onSuccessAcknowledged()
}

final class ForgotPasswordViewModel: ForgotPasswordViewModelProtocol {
    
    @Published var isLoading: Bool = false
    @Published var showError: Bool = false
    @Published var showSuccess: Bool = false
    @Published var errorMessage: String = ""
    
    private weak var coordinator: ForgotPasswordCoordinatorActions?
    private let interactor: ForgotPasswordInteractorProtocol
    private var tasks: [Task<Void, Never>] = []
    
    init(coordinator: ForgotPasswordCoordinatorActions, interactor: ForgotPasswordInteractorProtocol) {
        self.coordinator = coordinator
        self.interactor = interactor
    }
    
    @MainActor
    func sendResetPassword() {
        let task = Task {
            isLoading = true
            do {
                try await interactor.sendResetPasswordEmail()
                isLoading = false
                showSuccess = true
            } catch {
                isLoading = false
                errorMessage = error.localizedDescription
                showError = true
            }
        }
        tasks.append(task)
    }
    
    func onSuccessAcknowledged() {
        coordinator?.forgotPasswordFinished()
    }
    
    deinit {
        tasks.forEach { $0.cancel() }
    }
}
