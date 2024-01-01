//
//  RootView.swift
//  RealEstate
//
//  Created by Sharma Ji on 2024-01-14.
//

import SwiftUI

struct RootView: View {
    
    @State private var showUserProfileView: Bool  = false
    
    var body: some View {
//        ZStack {
//            NavigationStack {
//                UserProfileView(showSignInView: $showSignInView)
////                SettingsView(showSignInView: $showSignInView)
//            }
//        }
//        .onAppear {
//            let authuser = try? AuthenticationManager.shared.getAuthenticatedUser()
//            self.showSignInView = authuser == nil ? true : false
//        }
//        .fullScreenCover(isPresented: $showSignInView) {
//            NavigationStack {
//                LogInView()
//            }
//        }
        ZStack {
            NavigationStack {
                LogInView()
            }
            .onAppear {
                let authuser = try? AuthenticationManager.shared.getAuthenticatedUser()
                self.showUserProfileView = authuser == nil ? false : true
            }
            .navigationDestination(isPresented: $showUserProfileView) {
                UserProfileView()
            }
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
