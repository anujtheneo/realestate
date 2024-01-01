//
//  LogInView.swift
//  RealEstate
//
//  Created by aashi sharma on 2024-01-03.
//

import SwiftUI

@MainActor
final class SignInEmailViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    
//  Validation can be added here for password or email, and should be handled
    func signIn() {
        guard !email.isEmpty, !password.isEmpty else {
            print("No email or password found.")
            return
        }
        
        Task {
            do {
                let returnedUserData = try await AuthenticationManager.shared.SignInWithEmail(email: email, password: password)
                print("Success")
                print(returnedUserData)
            } catch {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
}


struct LogInView: View {
    @State private var username = ""
    @State private var password = ""
    @State var showSignUp: Bool = false
    
    @StateObject private var viewModel = SignInEmailViewModel()
    
 
    var body: some View {
        VStack {
            Logo(logoSizeParam: 75)
            TextField("Email", text: $viewModel.email)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())

            SecureField("Password", text: $viewModel.password)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())

            Button("Login") {
                viewModel.signIn()
            }
            .padding()
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(8)

            NavigationLink("Sign Up", destination: SignUpView())
                .padding()
                .foregroundColor(.blue)
        }
        .padding()
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            LogInView()
        }
    }
}

