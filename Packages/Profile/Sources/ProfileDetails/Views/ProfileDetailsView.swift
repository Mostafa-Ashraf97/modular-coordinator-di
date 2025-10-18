//
//  ProfileDetailsView.swift
//  Coordinator
//

import SwiftUI

struct ProfileDetailsView<ViewModel: ProfileDetailsViewModelProtocol>: View {
    
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        ZStack {
            Color.white
            
            VStack(spacing: 40) {
                Image(systemName: "person.text.rectangle.fill")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .foregroundColor(.blue)
                
                Text("Profile Details")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text("Edit your profile information here")
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 40)
                
                VStack(spacing: 15) {
                    DetailRow(label: "Name", value: "John Doe")
                    DetailRow(label: "Email", value: "john@example.com")
                    DetailRow(label: "Phone", value: "+1 234 567 8900")
                    DetailRow(label: "Location", value: "San Francisco, CA")
                }
                .padding(.horizontal, 40)
                
                Spacer()
            }
            .padding(.top, 100)
        }
        .navigationBarHidden(false)
    }
}

struct DetailRow: View {
    let label: String
    let value: String
    
    var body: some View {
        HStack {
            Text(label)
                .foregroundColor(.gray)
                .frame(width: 80, alignment: .leading)
            
            Text(value)
                .foregroundColor(.primary)
            
            Spacer()
        }
        .padding()
        .background(Color.blue.opacity(0.1))
        .cornerRadius(12)
    }
}

