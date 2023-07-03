//
//  User.swift
//  Twitter_IOS
//
//  Created by Student26 on 29/06/2023.
//
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift
struct User: Identifiable, Decodable{
    
    @DocumentID var id: String?
    let username: String
    let fullname: String
    let profileImageUrl: String
    let email: String
    
    var isCurrentUser: Bool {return Auth.auth().currentUser?.uid == id }
}
