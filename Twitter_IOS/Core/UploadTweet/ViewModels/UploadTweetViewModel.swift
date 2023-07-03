//
//  UploadTweetViewModel.swift
//  Twitter_IOS
//
//  Created by Student26 on 03/07/2023.
//

import Foundation

class UploadTweetViewModel: ObservableObject{
    @Published var didUploadTweet = false
    let service = TweetService()
    
    func uploadTweet(withCaption caption: String){
        service.uploadTweet(caption: caption) { success in
            if success{
                self.didUploadTweet = true
                self.service.fetchTweets{ good in

                }
            } else{
                
            }
        }
    }
}
