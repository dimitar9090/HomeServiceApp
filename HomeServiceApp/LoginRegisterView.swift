//
//  LoginRegisterView.swift
//  HomeServiceApp
//
//  Created by Dimitar Angelov on 15.10.24.
//
//

import SwiftUI

struct LoginRegisterView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                NavigationLink(destination: RegisterView()) {
                    Text("Регистрация")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }

                NavigationLink(destination: LoginView()) {
                    Text("Вход")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
            .navigationTitle("Добре дошли")
            .padding()
        }
    }
}

struct RegisterView: View {
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        VStack(spacing: 20) {
            TextField("Потребителско име", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("Имейл", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            SecureField("Парола", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button(action: {
                // Регистрация
            }) {
                Text("Регистрация")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
        .padding()
        .navigationTitle("Регистрация")
    }
}

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        VStack(spacing: 20) {
            TextField("Имейл", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            SecureField("Парола", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button(action: {
                // Вход
            }) {
                Text("Вход")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
        .padding()
        .navigationTitle("Вход")
    }
}

struct LoginRegisterView_Previews: PreviewProvider {
    static var previews: some View {
        LoginRegisterView()
    }
}
