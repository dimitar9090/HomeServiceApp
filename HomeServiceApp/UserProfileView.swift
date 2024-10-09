import SwiftUI

struct UserProfileView: View {
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var phoneNumber: String = ""
    @State private var userProfileData: UserProfileData = UserProfileData(name: nil, email: nil, phoneNumber: nil)
    
    var body: some View {
        VStack(spacing: 20) {
            TextField("Име", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .onChange(of: name) { newValue in
                    userProfileData.name = newValue.isEmpty ? nil : newValue
                }
            
            TextField("Имейл", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .onChange(of: email) { newValue in
                    userProfileData.email = newValue.isEmpty ? nil : newValue
                }
            
            TextField("Телефонен номер", text: $phoneNumber)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .onChange(of: phoneNumber) { newValue in
                    userProfileData.phoneNumber = newValue.isEmpty ? nil : newValue
                }
            
            Text("Въведено име: \(userProfileData.name ?? "Няма въведено име")")
                .padding()
            Text("Въведен имейл: \(userProfileData.email ?? "Няма въведен имейл")")
                .padding()
            Text("Въведен телефонен номер: \(userProfileData.phoneNumber ?? "Няма въведен номер")")
                .padding()
            
            Spacer()
        }
        .navigationTitle("Профил на потребителя")
        .padding()
    }
}

struct UserProfileData {
    var name: String?
    var email: String?
    var phoneNumber: String?
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView()
    }
}
