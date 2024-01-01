//
//  SettingsView.swift
//  RealEstate
//
//  Created by Sharma Ji on 2024-01-14.
//

import SwiftUI

struct SettingsView: View {
    @StateObject private var viewModel = SettingsViewModel()
    @Binding var showSignInView: Bool
 
    var body: some View {
        
        List {
            Button("Log Out") {
                Task {
                    do {
                        try viewModel.signOut()
                        showSignInView = true
                    } catch {
                        print(error)
                    }
                }
            }
            
            emailSection
            
        }
        .navigationBarTitle("Settings")
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SettingsView(showSignInView: .constant(false))
        }
    }
}

extension SettingsView{
    private var emailSection: some View {
        Section{
            Button("Reset Password") {
                Task {
                    do {
                        try await viewModel.resetPassword()
                        print("Password reset initiated")
                    } catch {
                        print(error)
                    }
                }
            }
            Button("Change Password") {
                Task {
                    do {
                        try await viewModel.updatePassword()
                        print("Password change initiated")
                    } catch {
                        print(error)
                    }
                }
            }
            Button("Change Email") {
                Task {
                    do {
                        try await viewModel.updateEmail()
                        print("Email change initiated")
                    } catch {
                        print(error)
                    }
                }
            }
        } header: {
            Text("Email Loging Options")
        }
    }
}
