//
//  ProfilePhotoSelectorView.swift
//  Twitter_IOS
//
//  Created by Student26 on 22/06/2023.
//
import PhotosUI
import SwiftUI


struct ProfilePhotoSelectorView: View {
    
    @State private var showImagePicker = false
    @State private var selectedImage: UIImage?
    @State private var profileImage: Image?
    
    @State private var avatarItem: PhotosPickerItem?
    @State private var avatarImage: Image?
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        VStack{
            AuthenticationHeaderView(title1: "Setup account", title2: "Select a profile photo")
            
            VStack {
                        PhotosPicker("Select avatar", selection: $avatarItem, matching: .images)

                        if let avatarImage {
                            avatarImage
                                .resizable()
                                .scaledToFit()
                                .frame(width: 300, height: 300)

                        }
                    }
                    .onChange(of: avatarItem) { _ in
                        Task {
                            if let data = try? await avatarItem?.loadTransferable(type: Data.self) {
                                if let uiImage = UIImage(data: data) {
                                    selectedImage = UIImage(data: data)
                                    avatarImage = Image(uiImage: uiImage)
                                    return
                                }
                            }

                            print("Failed")
                        }
                    }
                    .padding(.top,10)
            if let selectedImage = selectedImage{
                Button{
                  print("Debug: Finish registering user.. ")
                    viewModel.uplaodProfileImage(selectedImage)
                } label: {
                    Text("Continue")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 340, height: 50)
                        .background(Color(.systemBlue))
                        .clipShape(Capsule())
                        .padding()

                }
//                .shadow(color: .gray.opacity(0.5), radius: 10, x: 0 , y: 0)
            }
          
            Spacer()
        }.ignoresSafeArea()
    }
    
    func loadImage(){
        guard let selectedImage = selectedImage else{ return}
        profileImage = Image(uiImage: selectedImage)
    }
}
private struct ProfileImageModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 180, height: 180)
            .scaledToFill()
            .clipShape(Circle())
            
    }
}
struct ProfilePhotoSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePhotoSelectorView()
    }
}

//
//            Button {
//                showImagePicker.toggle()
//            } label: {
//                if let profileImage = profileImage{
//                    profileImage
//                        .resizable()
//                        .modifier(ProfileImageModifier())
//                }else{
//                    Image("plus")
//                        .renderingMode(.template)
//                        .modifier(ProfileImageModifier())
//                }
//            }
//            .sheet(isPresented: $showImagePicker, onDismiss: loadImage){
//                ImagePicker(selectedImage: $selectedImage)
//            }
//            .padding(.top,80)
