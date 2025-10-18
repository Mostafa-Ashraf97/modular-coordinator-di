//
//  NotificationSettingsView.swift
//  Coordinator
//

import SwiftUI

struct NotificationSettingsView<ViewModel: NotificationSettingsViewModelProtocol>: View {
    
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        ZStack {
            Color.white
            
            VStack(spacing: 40) {
                Image(systemName: "bell.badge.fill")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .foregroundColor(.blue)
                
                Text("Notification Settings")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text("Manage your notification preferences")
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 40)
                
                VStack(spacing: 20) {
                    NotificationToggleRow(title: "Push Notifications", isEnabled: true)
                    NotificationToggleRow(title: "Email Notifications", isEnabled: false)
                    NotificationToggleRow(title: "SMS Notifications", isEnabled: true)
                    NotificationToggleRow(title: "Marketing Updates", isEnabled: false)
                }
                .padding(.horizontal, 40)
                
                Spacer()
            }
            .padding(.top, 100)
        }
        .navigationBarHidden(false)
    }
}

struct NotificationToggleRow: View {
    let title: String
    let isEnabled: Bool
    
    var body: some View {
        HStack {
            Text(title)
                .foregroundColor(.primary)
            
            Spacer()
            
            Image(systemName: isEnabled ? "checkmark.circle.fill" : "circle")
                .foregroundColor(isEnabled ? .blue : .gray)
                .font(.system(size: 24))
        }
        .padding()
        .background(Color.blue.opacity(0.1))
        .cornerRadius(12)
    }
}

