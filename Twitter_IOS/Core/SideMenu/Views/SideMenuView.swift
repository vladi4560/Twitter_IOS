//
//  SideMenuView.swift
//  Twitter_IOS
//
//  Created by Student26 on 19/06/2023.
//

import SwiftUI

struct SideMenuView: View {
    var body: some View {
        VStack(alignment: .leading){
            VStack(alignment: .leading){
                Circle()
                    .frame(width: 48,height: 48)
                
                VStack(alignment: .leading, spacing: 4){
                    Text("Bruce Wayne")
                        .font(.headline)
                    
                    Text("@Batman")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                UserStatsView().padding(.vertical)
            }
            .padding(.leading)
            ForEach(SideMenuViewModel.allCases , id: \.rawValue){ viewModel in
                if viewModel == .profile{
                    NavigationLink{
                        ProfileView()
                    } label: {
                        SideMenuRowView(viewModel: viewModel)
                    }
                } else if viewModel == .logout{
                    Button{
                        print("Handle Logout here ...")
                    } label: {
                        SideMenuRowView(viewModel: viewModel)
                    }
                } else{
                    SideMenuRowView(viewModel: viewModel)
                }
            }
                Spacer()
            }
            
        }
    }
    
struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView()
    }
}
