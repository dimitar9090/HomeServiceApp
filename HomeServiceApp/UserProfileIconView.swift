//
//  UserProfileIconView.swift
//  HomeServiceApp
//
//  Created by Dimitar Angelov on 14.10.24.
//

import SwiftUI

struct UserProfileIconView: View {
    @State private var phoneNumber: String = UserDefaults.standard.string(forKey: "phoneNumber") ?? ""
    @State private var email: String = UserDefaults.standard.string(forKey: "email") ?? ""
    @State private var name: String = UserDefaults.standard.string(forKey: "name") ?? ""
    @State private var isEditing: Bool = false // Проследяване дали сме в режим на редакция

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                VStack(alignment: .leading) {
                    Image(systemName: "person.circle")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .foregroundColor(.blue)
                    
                    Text("Име: \(name)")
                        .font(.headline)
                    Text("E-mail: \(email)")
                        .font(.subheadline)
                    Text("Телефонен номер: \(phoneNumber)")
                        .font(.subheadline)
                }
                .padding()

                Button(action: {
                    isEditing = true // Преминаване към режим на редакция
                }) {
                    Text("Редактирай")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .sheet(isPresented: $isEditing, onDismiss: loadUserData) {
                    UserProfileView()
                }
                
                Spacer()
            }
            .navigationTitle("Профил")
            .onAppear(perform: loadUserData)
            .padding()
        }
    }

    private func loadUserData() {
        // Зареждане на данните от UserDefaults след редакция
        phoneNumber = UserDefaults.standard.string(forKey: "phoneNumber") ?? ""
        email = UserDefaults.standard.string(forKey: "email") ?? ""
        name = UserDefaults.standard.string(forKey: "name") ?? ""
    }
}

struct UserProfileIconView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileIconView()
    }
}
