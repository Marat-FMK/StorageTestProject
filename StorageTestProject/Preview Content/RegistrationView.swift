//
//  RegistrationView.swift
//  StorageTestProject
//
//  Created by Marat Fakhrizhanov on 24.03.2025.
//

import SwiftUI
import FirebaseAuth

struct RegistrationView: View {
    @Binding var path: NavigationPath
    
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
            
        VStack{
            TextField("Email", text: $email)
                .textFieldStyle(.roundedBorder)
            
            TextField("Password", text: $password)
                .textFieldStyle(.roundedBorder)
            
            Button {
                Auth.auth().createUser(withEmail: email, password: password) {_, error in
                    
                    if error == nil {
                        print(" new user active ")
                    } else {
                        print(" error / no new user")
                    }
                    
                }
            } label: {
                Text("Registrantion")
            }
        }
        
    }
}

#Preview {
    RegistrationView(path: .constant(NavigationPath()))
}
