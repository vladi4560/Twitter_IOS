//
//  AuthViewModel.swift
//  Twitter_IOS
//
//  Created by Student26 on 21/06/2023.
//

import SwiftUI
import Firebase
import FirebaseFirestore

class AuthViewModel: ObservableObject{
    @Published var userSession: FirebaseAuth.User?
    @Published var didAuthenticateUse = false
    @Published var currentUser: User?
    private var tempUserSession: FirebaseAuth.User?
    
    private var service = UserService()
    
    init(){
        self.userSession = Auth.auth().currentUser
        self.fetchUser()
        print("Debug: User session is  \(self.userSession)")
    }
    
    func login(withEmail email: String, password: String){
        Auth.auth().signIn(withEmail: email, password: password){ result, error in
            if let error = error{
                print("Debug: Failed to SignIn  with an  error \(error.localizedDescription)")
                return
            }
            guard let user = result?.user else {return}
            self.userSession = user
            self.fetchUser()
            print("Debug: Did log User Successfully")
        }
    }
    
    func register(withEmail email: String, password: String, fullname: String, username: String){
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("Debug: Failed to register  with error \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else {return}
            self.tempUserSession = user
            print("Debug: Created User Successfully")
            
            let data = [ "email": email, "username": username.lowercased(),"fullname": fullname,"uid":user.uid]
            
            Firestore.firestore().collection("users").document(user.uid).setData(data){ _ in
                self.didAuthenticateUse = true
                
            }
        }
    }
    
    func signOut(){
        
        // sets user session to nil so we show login view
        userSession = nil
        // sings user out on server
        try? Auth.auth().signOut()
    }
    
    
    func uplaodProfileImage(_ image: UIImage){
        guard let uid = tempUserSession?.uid else {return}
        
        ImageUploader.uploadImage(image: image) { profileImageUrl in
            Firestore.firestore().collection("users")
                .document(uid)
                .updateData(["profileImageUrl": profileImageUrl]){ _ in
                    self.userSession = self.tempUserSession
                    self.fetchUser()
                }
        }
    }
    
    
    func fetchUser(){
        guard let uid = self.userSession?.uid else {return}
        
        service.fetchUser(withUid: uid) { user in
            self.currentUser = user
            
        }
    }
}
