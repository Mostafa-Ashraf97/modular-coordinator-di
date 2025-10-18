//
//  ForgotPasswordView.swift
//  Coordinator
//

import SwiftUI

struct ForgotPasswordView<ViewModel: ForgotPasswordViewModelProtocol>: View {
    
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        if #available(iOS 15.0, *) {
            ZStack {
                Color.white
                
                VStack(spacing: 40) {
                    Text("Forgot Password")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    Text("Reset password functionality")
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 40)
                    
                    Button(action: {
                        viewModel.sendResetPassword()
                    }) {
                        Text("Send Reset Link")
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .frame(height: 55)
                            .background(Color.blue)
                            .cornerRadius(12)
                    }
                    .padding(.horizontal, 40)
                    
                    Button(action: {
                        viewModel.onSuccessAcknowledged()
                    }) {
                        Text("Back to Login")
                            .fontWeight(.medium)
                            .foregroundColor(.blue)
                            .frame(maxWidth: .infinity)
                            .frame(height: 55)
                            .background(Color.blue.opacity(0.1))
                            .cornerRadius(12)
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
            .alert("Success", isPresented: $viewModel.showSuccess) {
                Button("OK") {
                    viewModel.onSuccessAcknowledged()
                }
            } message: {
                Text("Password reset link sent!")
            }
            .alert("Error", isPresented: $viewModel.showError) {
                if #available(iOS 15.0, *) {
                    Button("OK", role: .cancel) { }
                } else {
                    // Fallback on earlier versions
                }
            } message: {
                Text(viewModel.errorMessage)
            }
        } else {
            // Fallback on earlier versions
        }
    }
}
