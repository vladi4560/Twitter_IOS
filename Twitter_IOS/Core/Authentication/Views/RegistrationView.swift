//
//  RegistrationView.swift
//  Twitter_IOS
//
//  Created by Student26 on 21/06/2023.
//

import SwiftUI

struct RegistrationView: View {
    
    @State private var email = ""
    @State private var userName = ""
    @State private var fullName = ""
    @State private var password = ""
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        NavigationStack{
            VStack{
                
                NavigationLink(destination: ProfilePhotoSelectorView(),isActive: $viewModel.didAuthenticateUse , label: { })
                AuthenticationHeaderView(title1: "Get Started..", title2: "Create Your Account")
                
                VStack(spacing: 40){
                    CustomInputField(imageName: "envelope", plcaholderText: "Email", text: $email)
                    
                    CustomInputField(imageName: "person", plcaholderText: "UserName", text: $userName)
                    
                    CustomInputField(imageName: "person", plcaholderText: "Full name", text: $fullName)
                    
                    CustomInputField(imageName: "lock", plcaholderText: "Password",isSecuredField: true, text: $password)
                }.padding(32)
                
                
                Button{
                    viewModel.register(withEmail: email, password: password, fullname: fullName, username: userName)
                } label: {
                    Text("Sign Up")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 340, height: 50)
                        .background(Color(.systemBlue))
                        .clipShape(Capsule())
                        .padding()
                    
                }
                .shadow(color: .gray.opacity(0.5), radius: 10, x: 0 , y: 0)
                
                
                Spacer()
                
                Button{
                    presentationMode.wrappedValue.dismiss()
                }label: {
                    Text("Already have an account?")
                        .font(.footnote)
                    
                    Text("Sign in")
                        .font(.footnote)
                        .fontWeight(.semibold)
                }.padding(.bottom,32)
                
                
                
            }.ignoresSafeArea()
        }
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
