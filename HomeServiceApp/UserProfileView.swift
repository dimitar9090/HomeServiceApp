import SwiftUI

struct UserProfileView: View {
    @State private var phoneNumber: String = ""
    @State private var email: String = ""
    @State private var name: String = ""
    
    @State private var userProfileData: UserProfileData = UserProfileData(phoneNumber: nil, email: nil, name: nil)
  
    var body: some View {
        VStack(spacing: 20) {
            TextField("Телефонен номер", text: $phoneNumber)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .onSubmit {
                    userProfileData.phoneNumber = phoneNumber.isEmpty ? nil : phoneNumber
                }
            
            TextField("E-mail адрес", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .onSubmit {
                    userProfileData.email = email.isEmpty ? nil : email
                }
            
            TextField("Име", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .onSubmit {
                    userProfileData.name = name.isEmpty ? nil : name
                }
            
            Text("Въведен телефонен номер: \(userProfileData.phoneNumber ?? "Няма въведен номер")")
                .padding()
            
            Text("Въведен имейл: \(userProfileData.email ?? "Няма въведен имейл")")
                .padding()
            
            Text("Въведено име: \(userProfileData.name ?? "Няма въведено име")")
                .padding()
            
            Spacer()
        }
        .navigationTitle("Профил на потребителя")
        .padding()
    }
}

struct UserProfileData {
    var phoneNumber: String?
    var email: String?
    var name: String?
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView()
    }
}
