//
//  UserProfileView.swift
//  RealEstate
//
//  Created by aashi sharma on 2024-01-06.
//

import SwiftUI
import FirebaseAuth

//@MainActor
//final class ProfileViewModel: ObservableObject {
//
//    @Published private(set) var user: AuthDataResultModel? = nil
//    func loadCurrentUser() {
//        let authDataResults = AuthenticationManager.shared.get
//    }
//
//}

struct UserProfileView: View {
    
//    @State private var viewModel = ProfileViewModel()
    
    @State var showMenuBarItems: Bool = false

    @State private var firstName = ""
    @State private var middleName = ""
    @State private var lastName = ""
    @State private var dob = Date()
    
    @State private var unitNumber = ""
    @State private var streetNumber = ""
    @State private var streetName = ""
    @State private var city = ""
    @State private var province = ""
    @State private var postalCode = ""
    
    @State private var phoneNumber = ""

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("User Information")) {
                    TextField("First Name", text: $firstName)
                    TextField("Middle Name", text: $middleName)
                    TextField("Last Name", text: $lastName)
                }
                
                Section(header: Text("Date of Birth")) {
                    DatePicker("Select Date", selection: $dob, in: ...Date(), displayedComponents: .date)
                        .datePickerStyle(DefaultDatePickerStyle())
                }
                
                Section(header: Text("Address")) {
                    HStack {
                        TextField("Unit#", text: $unitNumber)
                            .textContentType(.fullStreetAddress)
                        TextField("Street#", text: $streetNumber)
                            .textContentType(.fullStreetAddress)
                    }
                    TextField("Street Name", text: $streetName)
                        .textContentType(.streetAddressLine1)
                    TextField("City", text: $city)
                        .textContentType(.addressCity)
                    HStack {
                        TextField("Province", text: $province)
                            .textContentType(.addressState)
                        TextField("Postal Code", text: $postalCode)
                            .textContentType(.postalCode)
                    }
                }
                
                Section(header: Text("Phone")) {
                    TextField("Phone", text: $phoneNumber)
                        .textContentType(.telephoneNumber)
                        .keyboardType(.phonePad)
                }
                
                Section {
                    Button(action: {
                        // Handle form submission logic here
                        submitForm()
                    }) {
                        Text("Submit")
                    }
                }
            }
            .navigationTitle("User Profile")
            .navigationBarTitleDisplayMode(.automatic)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                     Menu (
                        content: {
                            NavigationLink("User Profile", destination: SignUpView())
                            NavigationLink("Property", destination: SignUpView())
                            NavigationLink("Documents", destination: SignUpView())
                            NavigationLink("Listing", destination: SignUpView())
                            NavigationLink("Offers", destination: SignUpView())
                            NavigationLink("Appointments", destination: SignUpView())
                        },
                        label: {
                            Image(systemName: "list.bullet")
                        }
                     )
                }

                ToolbarItem(placement: .navigationBarLeading) {
                    NavigationLink("Sign Out", destination: LogInView())
                }
            }
            if showMenuBarItems {
                MenuItemsView()
                    .transition(.move(edge: .top))
                    //.animation(.spring())
            }
        }
    }

    func submitForm() {
        // Perform actions with collected data, e.g., send to a server, save locally, etc.
        print("User Name: \(firstName) \(lastName)")
        print("Address: \(unitNumber) \(streetNumber) \(streetName) \(city) \(province) \(postalCode)")
        print("Date of Birth: \(dob)")
        print("Phone: \(phoneNumber)")
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView()
    }
}
