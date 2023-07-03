//
//  UserService.swift
//  Twitter_IOS
//
//  Created by Student26 on 29/06/2023.
//
import Firebase
import FirebaseFirestoreSwift
import FirebaseFirestore



struct UserService {
    
    func fetchUser(withUid uid: String, completion: @escaping(User) -> Void){
//        Firestore.firestore().collection("users").document(uid).getDocument { (snapshot, error) in
//            guard let snapshot = snapshot else {
//                print("Error fetching user document: \(error?.localizedDescription ?? "")")
//                return
//            }
        Firestore.firestore().collection("users").document(uid).getDocument { snapshot, _ in
            
            guard let snapshot = snapshot else {return}
            
            guard let user = try? snapshot.data(as: User.self) else {return}
            completion(user)
        }
           
//            if let data = document.data() {
//                let id = document.documentID
//                let username = data["username"] as? String ?? ""
//                let fullname = data["fullname"] as? String ?? ""
//                let email = data["email"] as? String ?? ""
//                let image = data["profileImageUrl"] as? String ?? ""
//
//                let user = User(id: id, username: username, fullname: fullname, profileImageUrl: image, email: email)
//
//                completion(user)
//                //self.user = YourStruct(id: id, name: name, age: age)
//            }
       // }
        
    }
    
    func fetchUsers(completion: @escaping([User]) -> Void){
        
        Firestore.firestore().collection("users").getDocuments { snapshot, _ in
            
            guard let documents = snapshot?.documents else {return}
            
            let user = documents.compactMap({ try? $0.data(as: User.self) })
            completion(user)
        }
        
//        var users = [User] ()
//        Firestore.firestore().collection("users")
//            .getDocuments{ snapshot, _ in
//                guard let documents = snapshot?.documents else {return}
//                documents.forEach{document in
//                    let data = document.data()
//                    let id = document.documentID
//                    let username = data["username"] as? String ?? ""
//                    let fullname = data["fullname"] as? String ?? ""
//                    let email = data["email"] as? String ?? ""
//                    let image = data["profileImageUrl"] as? String ?? ""
//
//                    let user = User(id: id, username: username, fullname: fullname, profileImageUrl: image, email: email)
//
//
//                    users.append(user)
//                }
//                completion(users)
//            }
    }
}
