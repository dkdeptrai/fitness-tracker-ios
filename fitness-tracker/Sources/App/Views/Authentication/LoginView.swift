//
//  LoginView.swift
//  fitness-tracker
//
//  Created by Đình Khoa Nguyễn on 26/10/24.
//

import SwiftUI

struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var showingPassword: Bool = false
    @State private var showingAlert: Bool = false
    @State private var alertMessage: String = ""
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Login")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            TextField("Username", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            ZStack(alignment: .trailing) {
                if showingPassword {
                    TextField("Password", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                } else {
                    SecureField("Password", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                }
                Button(action: {
                                 showingPassword.toggle()
                             }) {
                                 Image(systemName: showingPassword ? "eye.slash" : "eye")
                                     .foregroundColor(.gray)
                                     .padding(.trailing, 15)
                             }
            }
            Button(action: login) {
                Text("Login")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(8)
            }
            .padding(.horizontal)
            .alert(isPresented: $showingAlert) {
                Alert(title: Text("Error"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            }
        }
        .padding()
    }
    
    func login() {
        guard !username.isEmpty, !password.isEmpty else {
            alertMessage = "Please enter both username and password."
            showingAlert = true
            return
        }
        
        // Simulate an API call for login
        authenticateUser(username: username, password: password) { success, token in
            if success, let token = token {
                // Store the access token in
//                TokenManager.shared.token = token
                print("Login successful! Token saved.")
                // Navigate to the main app content or update app state here
            } else {
                alertMessage = "Invalid username or password."
                showingAlert = true
            }
        }
    }
    
    func authenticateUser(username: String, password: String, completion: @escaping (Bool, String?) -> Void) {
        // Simulate an API response with a delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            if username == "test" && password == "password" {
                completion(true, "sampleAccessToken123")
            } else {
                completion(false, nil)
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
