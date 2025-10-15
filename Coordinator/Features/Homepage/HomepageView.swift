//
//  HomepageView.swift
//  MyCoordinatorPattern
//

import SwiftUI

struct HomepageView<ViewModel: HomepageViewModelProtocol>: View {
    
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            
            VStack(spacing: 40) {
                Image(systemName: "house.fill")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .foregroundColor(.blue)
                
                Text("Home Screen")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text("Welcome to the app!")
                    .foregroundColor(.gray)
                
                VStack(spacing: 20) {
                    Button(action: {
                        viewModel.navigateToProfile()
                    }) {
                        HStack {
                            Image(systemName: "person.fill")
                            Text("Profile")
                        }
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 55)
                        .background(Color.blue)
                        .cornerRadius(12)
                    }
                    
                    Button(action: {
                        viewModel.navigateToSettings()
                    }) {
                        HStack {
                            Image(systemName: "gear")
                            Text("Settings")
                        }
                        .fontWeight(.semibold)
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
        }
        .navigationBarHidden(true)
    }
}
