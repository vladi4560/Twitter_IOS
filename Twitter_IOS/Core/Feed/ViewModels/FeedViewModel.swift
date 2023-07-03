//
//  FeedViewModel.swift
//  Twitter_IOS
//
//  Created by Student26 on 03/07/2023.
//

import Foundation

class FeedViewModel: ObservableObject{
    @Published var tweets = [Tweet]()
    let sevice = TweetService()
    let userService = UserService()
    
    init(){
        fetchTweets()
    }
    
    func fetchTweets(){
        sevice.fetchTweets{ tweets in
            self.tweets = tweets
            
            for i in 0 ..< tweets.count {
                let uid = tweets[i].uid
                
                self.userService.fetchUser(withUid: uid){ user in
                    self.tweets[i].user = user
                }
                
            }
        }
    }
}
