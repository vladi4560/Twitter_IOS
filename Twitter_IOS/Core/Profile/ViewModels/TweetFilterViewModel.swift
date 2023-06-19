//
//  TweetFilterViewModel.swift
//  Twitter_IOS
//
//  Created by Student26 on 19/06/2023.
//

import Foundation

enum TweetFilterViewModel: Int, CaseIterable{
    
    case tweets
    case replies
    case likes
    
    var title:String {
        switch self{
        case .tweets: return "Tweets"
        case .replies:  return "Replies"
        case .likes: return "Likes"
        }
    }
    
}
