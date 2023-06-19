//
//  SideMenuRowView.swift
//  Twitter_IOS
//
//  Created by Student26 on 19/06/2023.
//

import SwiftUI

struct SideMenuRowView: View {
    let viewModel: SideMenuViewModel
    
    var body: some View {
        HStack(spacing : 16){
            Image(systemName:  viewModel.imageName)
                .font(.headline)
                .foregroundColor(.gray)
            
            Text(viewModel.title)
                .foregroundColor(.black)
                .font(.subheadline)
            
            Spacer()
        }
        .frame( height: 40)
        .padding(.horizontal)
}
}


struct SideMenuRowView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuRowView(viewModel: .profile)
    }
}
