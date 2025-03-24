//
//  ContentView.swift
//  StorageTestProject
//
//  Created by Marat Fakhrizhanov on 19.03.2025.
//

import SwiftUI
//import Firebase
import FirebaseAuth

extension ContentView {
    enum Path {
        case MainView
        case RegistrationView
    }
}
struct ContentView: View {
    
    @State private var email = ""
    @State private var password = ""
    @State private var path = NavigationPath()
    
    var body: some View {
        
        NavigationStack(path: $path) {
            VStack {
                TextField("Email", text: $email)
                    .textFieldStyle(.roundedBorder)
                
                TextField("Password", text: $password)
                    .textFieldStyle(.roundedBorder)
                
                Button {
                    
                    Auth.auth().signIn(withEmail: email, password: password ){ one,two in
                        
                        if two == nil {
                            path.append(Path.MainView)
                        }
                    }
                }label: {
                    Text("LogIn")
                }
                
                Button {
                    path.append(Path.RegistrationView)
                } label: {
                    Text ("registration new accaunt")
                }
            }
            .navigationDestination(for: Path.self) { value in
                switch value {
                    
                case .MainView : MainView(path: $path)
                case .RegistrationView : RegistrationView(path: $path)
                }
            }
        }
    }
}
#Preview {
    ContentView()
}
