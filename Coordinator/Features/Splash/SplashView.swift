//
//  SplashView.swift
//  MyCoordinatorPattern
//

import SwiftUI

struct SplashView<ViewModel: SplashViewModelProtocol>: View {
    
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        ZStack {
            Color.blue.opacity(0.1)
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Image(systemName: "star.fill")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.blue)
                
                Text("Welcome")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                ProgressView()
                    .scaleEffect(1.5)
            }
        }
        .onAppear {
            viewModel.onAppear()
        }
    }
}
