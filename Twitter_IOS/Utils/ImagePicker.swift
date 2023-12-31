//
//  ImagePicker.swift
//  Twitter_IOS
//
//  Created by Student26 on 25/06/2023.
//

import SwiftUI


struct ImagePicker: UIViewControllerRepresentable{
    @Binding var selectedImage: UIImage?
    @Environment (\.presentationMode) var presentationMode
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}
extension ImagePicker{
    class Coordinator: NSObject, UINavigationControllerDelegate , UIImagePickerControllerDelegate{
        let parent: ImagePicker
        
        init(_ parent: ImagePicker) {
            self.parent = parent
        }
        
        private func iamgePickerController(_ picker: UIViewControllerType, didFinishPickingMEdiaWithInfo info:[UIImagePickerController.InfoKey : Any]) {
            guard let image = info[.originalImage] as? UIImage else{return}
            parent.selectedImage = image
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
    
}
