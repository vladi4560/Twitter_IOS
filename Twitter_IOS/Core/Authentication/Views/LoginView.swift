//
//  LoginView.swift
//  Twitter_IOS
//
//  Created by Student26 on 21/06/2023.
//

import SwiftUI

struct LoginView: View {
    @State private var email=""
    @State private var password=""
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        // parent container
        VStack{
            
            // header view
           AuthenticationHeaderView(title1: "Hello.", title2: "Welcome Back")
            
            VStack(spacing: 40){
               CustomInputField(imageName: "envelope", plcaholderText: "Email", text: $email)
                
                CustomInputField(imageName: "lock", plcaholderText: "Password",isSecuredField: true, text: $password)
            }
            .padding(.horizontal,42)
            .padding(.top,44)
            
            HStack{
                Spacer()
                
                NavigationLink{
                    Text("Reset password view..")
                } label: {
                    Text("Forgot Password?")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(Color(.systemBlue))
                        .padding(.top)
                        .padding(.trailing,24)
                }
            }
            
            Button{
                viewModel.login(withEmail: email, password: password)
            } label: {
                Text("Sign In")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 340, height: 50)
                    .background(Color(.systemBlue))
                    .clipShape(Capsule())
                    .padding()
                
            }
            .shadow(color: .gray.opacity(0.5), radius: 10, x: 0 , y: 0)
            
            Spacer()
            
            
            NavigationLink{
                RegistrationView()
                    .navigationBarHidden(true)
            } label: {
                Text("Don't have an account?")
                    .font(.footnote)
                
                Text("Sign Up")
                    .font(.footnote)
                    .fontWeight(.semibold)
                
            }.padding(.bottom,32)
                .foregroundColor(Color(.systemBlue))
            
            
            
        }.ignoresSafeArea()
        .navigationBarHidden(true)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
