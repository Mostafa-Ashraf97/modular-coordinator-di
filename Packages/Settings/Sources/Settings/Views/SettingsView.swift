//
//  SettingsView.swift
//  Coordinator
//

import SwiftUI

struct SettingsView<ViewModel: SettingsViewModelProtocol>: View {
    
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        ZStack {
            Color.white
            
            VStack(spacing: 40) {
                Image(systemName: "gear")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .foregroundColor(.blue)
                
                Text("Settings")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                VStack(spacing: 20) {
                    Button(action: {
                        viewModel.navigateToNotifications()
                    }) {
                        SettingsRow(icon: "bell.fill", title: "Notifications", showChevron: true)
                    }
                    
                    SettingsRow(icon: "lock.fill", title: "Privacy", showChevron: true)
                    SettingsRow(icon: "doc.text.fill", title: "Terms & Conditions", showChevron: true)
                    SettingsRow(icon: "info.circle.fill", title: "About", showChevron: true)
                    SettingsRow(icon: "arrow.right.circle.fill", title: "Logout", showChevron: false)
                }
                .padding(.horizontal, 40)
                
                Spacer()
            }
            .padding(.top, 100)
        }
        .navigationBarHidden(false)
    }
}

struct SettingsRow: View {
    let icon: String
    let title: String
    let showChevron: Bool
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.blue)
                .frame(width: 30)
            
            Text(title)
                .foregroundColor(.primary)
            
            Spacer()
            
            if showChevron {
                Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
                    .font(.system(size: 14))
            }
        }
        .padding()
        .background(Color.blue.opacity(0.1))
        .cornerRadius(12)
    }
}

