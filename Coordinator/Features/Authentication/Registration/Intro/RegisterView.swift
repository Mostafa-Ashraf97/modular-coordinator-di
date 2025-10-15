//
//  RegisterView.swift
//  MyCoordinatorPattern
//

import SwiftUI

struct RegisterView<ViewModel: RegistrationViewModelProtocol>: View {
    
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            
            VStack(spacing: 40) {
                Text("Sign Up Screen")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text("Create your account")
                    .foregroundColor(.gray)
                
                Button(action: {
                    viewModel.continueToGenderSelection(firstName: "User", lastName: "Test")
                }) {
                    Text("Complete Sign Up")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 55)
                        .background(Color.blue)
                        .cornerRadius(12)
                }
                .padding(.horizontal, 40)
                
                Spacer()
            }
            .padding(.top, 100)
        }
    }
}
