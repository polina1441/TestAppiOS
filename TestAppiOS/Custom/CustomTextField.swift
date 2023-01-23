//
//  CustomTextField.swift
//  TestAppiOS
//
//  Created by Полина Данилова on 24.01.2023.
//

import SwiftUI

struct CustomTextField : ViewModifier {
    var img : Image
    func body(content: Content) -> some View {
        content
            .padding(15)
            .padding(.leading, 36)
            .background(.white)
            .mask(RoundedRectangle(cornerRadius: 10, style: .continuous))
            .overlay(RoundedRectangle(cornerRadius: 10, style: .continuous).stroke().fill(.black.opacity(0.1)))
            .overlay(img
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 8)
            )
    }
}

extension View{
    func customTextFields(img : Image = Image("Icon Email")) -> some View {
        modifier(CustomTextField(img : img))
    }
}
