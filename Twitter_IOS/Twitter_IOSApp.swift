//
//  Twitter_IOSApp.swift
//  Twitter_IOS
//
//  Created by Student26 on 18/06/2023.
//

import SwiftUI
import Firebase
@main
struct Twitter_IOSApp: App {
    @StateObject var viewModel = AuthViewModel()
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            NavigationView{
              // ProfilePhotoSelectorView()
              ContentView()
            }.environmentObject(viewModel)
        }
    }
}
