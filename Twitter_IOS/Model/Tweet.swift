//
//  Tweet.swift
//  Twitter_IOS
//
//  Created by Student26 on 03/07/2023.
//

import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

struct Tweet: Identifiable ,Decodable{
    @DocumentID var id: String?
    let caption: String
    let timestamp: Timestamp
    let uid: String
    var likes: Int
    
    var user: User?
    var didLike:Bool? = false
}
