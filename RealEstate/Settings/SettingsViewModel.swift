//
//  SettingsViewModel.swift
//  RealEstate
//
//  Created by Sharma Ji on 2024-01-20.
//

import Foundation

@MainActor
final class SettingsViewModel: ObservableObject {
    
    func signOut() throws {
        try AuthenticationManager.shared.signOut()
    }
    
    func resetPassword() async throws {
        let authUser = try AuthenticationManager.shared.getAuthenticatedUser()
        guard let email = authUser.email else {
            throw URLError(.fileDoesNotExist)
        }
        
        try await AuthenticationManager.shared.resetPassword(email: email)
    }
    
    func updatePassword() async throws {
        try await AuthenticationManager.shared.updatePassword(password: "test")
    }
    
    func updateEmail() async throws {
        try await AuthenticationManager.shared.updateEmail(email: "abc@test.ca")
    }
    
}
