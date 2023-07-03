//
//  TweetRowViewModel.swift
//  Twitter_IOS
//
//  Created by Student26 on 03/07/2023.
//

import Foundation
class TweetRowViewModel: ObservableObject{
    private let service = TweetService()
    @Published var tweet: Tweet
    
    init(tweet: Tweet){
        self.tweet = tweet
        checkiIfUserLikedTweet()
    }
    func likeTweet(){
        service.likeTweet(tweet) {
            self.tweet.didLike = true
        }
    }
    func unlikeTweet(){
        service.unlikeTweet(tweet) {
            self.tweet.didLike = false
        }
    }
    
    func checkiIfUserLikedTweet(){
        service.checkIfUserLikedTweet(tweet) { didLike in
            if didLike{
                self.tweet.didLike = true
            }
        }
    }
}
