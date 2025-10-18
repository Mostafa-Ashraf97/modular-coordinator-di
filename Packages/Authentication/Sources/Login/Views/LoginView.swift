//
//  LoginView.swift
//  Coordinator
//

import SwiftUI

struct LoginView<ViewModel: LoginViewModelProtocol>: View {
    @ObservedObject var viewModel: ViewModel

    var body: some View {
        if #available(iOS 15.0, *) {
            ZStack {
                Color.white.ignoresSafeArea()

                VStack(spacing: 40) {
                    Text("Login Screen")
                        .font(.largeTitle)
                        .fontWeight(.bold)

                    VStack(spacing: 20) {
                        Button(action: {
                            viewModel.performLogin()
                        }) {
                            Text("Login (Simulate Success)")
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .frame(height: 55)
                                .background(Color.blue)
                                .cornerRadius(12)
                        }

                        Button(action: {
                            viewModel.navigateToForgotPassword()
                        }) {
                            Text("Forgot Password?")
                                .fontWeight(.medium)
                                .foregroundColor(.blue)
                                .frame(maxWidth: .infinity)
                                .frame(height: 55)
                                .background(Color.blue.opacity(0.1))
                                .cornerRadius(12)
                        }

                        Button(action: {
                            viewModel.navigateToRegister()
                        }) {
                            Text("Sign Up")
                                .fontWeight(.medium)
                                .foregroundColor(.blue)
                                .frame(maxWidth: .infinity)
                                .frame(height: 55)
                                .background(Color.blue.opacity(0.1))
                                .cornerRadius(12)
                        }
                    }
                    .padding(.horizontal, 40)

                    Spacer()
                }
                .padding(.top, 100)

                if viewModel.isLoading {
                    Color.black.opacity(0.4)
                        .ignoresSafeArea()

                    ProgressView()
                        .scaleEffect(1.5)
                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
                }
            }
            .alert("Error", isPresented: $viewModel.showError) {
                Button("OK", role: .cancel) {}
            } message: {
                Text(viewModel.errorMessage)
            }
        } else {
            // Fallback on earlier versions
        }
    }
}
