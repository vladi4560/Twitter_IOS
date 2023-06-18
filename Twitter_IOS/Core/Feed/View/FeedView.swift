//
//  FeedView.swift
//  Twitter_IOS
//
//  Created by Student26 on 18/06/2023.
//

import SwiftUI

struct FeedView: View {
    var body: some View{
        ScrollView{
            LazyVStack{
                ForEach(0 ... 20 , id:\.self){ _ in 
                   TweetRowView()
                        .padding()
                }
            }
            
        }
    }
}


struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
