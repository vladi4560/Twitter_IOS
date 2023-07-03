//
//  CustomInputField.swift
//  Twitter_IOS
//
//  Created by Student26 on 21/06/2023.
//

import SwiftUI

struct CustomInputField: View {
    let imageName: String
    let plcaholderText: String
    var isSecuredField: Bool? = false
    @Binding var text: String
    
    var body: some View {
        VStack{
            HStack{
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20 , height: 20)
                    .foregroundColor(Color(.darkGray))
                
                if isSecuredField ?? false {
                    SecureField(plcaholderText, text: $text)
                }else{
                    TextField(plcaholderText, text: $text)
                }
               
            }
            Divider()
                .background(Color(.darkGray))
        }
    }
}

struct CustomInputField_Previews: PreviewProvider {
    static var previews: some View {
        CustomInputField(imageName: "envelope", plcaholderText: "Email",isSecuredField: false, text: .constant(""))
    }
}
