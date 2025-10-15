//
//  ProfileView.swift
//  MyCoordinatorPattern
//

import SwiftUI

struct ProfileView<ViewModel: ProfileViewModelProtocol>: View {
    
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            
            VStack(spacing: 40) {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.blue)
                
                Text("Profile Screen")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text("Your profile information")
                    .foregroundColor(.gray)
                
                Button(action: {
                    viewModel.navigateToDetails()
                }) {
                    HStack {
                        Image(systemName: "pencil")
                        Text("Edit Profile Details")
                    }
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
        .navigationBarHidden(false)
    }
}
