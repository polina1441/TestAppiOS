//
//  SignInView.swift
//  TestAppiOS
//
//  Created by Полина Данилова on 24.01.2023.
//

import SwiftUI

struct SignInView: View {
    @State var email : String = ""
    @State var password : String = ""
    var body: some View {
        VStack(spacing: 24) {
            Text("Sign in").customFont(.largeTitle).bold()
            Text("Access to 240+ hours of content.Learn design and code, by building real apps with React and Swift.").customFont(.headline)
                .foregroundColor(.secondary)
            VStack(alignment: .leading) {
                Text("Email").customFont(.subheadline)
                    .foregroundColor(.secondary)
                TextField("", text: $email)
                    .customTextFields()
            }
            VStack {
                HStack {
                    Text("Email").customFont(.subheadline)
                        .foregroundColor(.secondary)
                    Spacer()
                    Button{} label: {
                        Text("Forgot Password").customFont(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }
                SecureField("", text: $password)
                    .customTextFields(img: Image("Icon Lock"))
            }
            HStack {
                Rectangle().frame(height: 1).opacity(0.1)
                Text("OR").customFont(.subheadline2)
                    .foregroundColor(.black.opacity(0.3))
                Rectangle().frame(height: 1).opacity(0.1)
            }
            Text("Sign up with Email, Apple or Google").customFont(.subheadline)
                .foregroundColor(.secondary)
            HStack {
                Image("Logo Email")
                Spacer()
                Image("Logo Apple")
                Spacer()
                Image("Logo Google")
            }
        }
        .padding(30)
        .background(.regularMaterial)
        .mask(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: Color("Shadow").opacity(0.3), radius: 5, x: 0, y: 3)
        .shadow(color: Color("Shadow").opacity(0.3), radius: 30, x: 0, y: 30)
        .overlay(stroke_card)
        .padding()
    }
    var stroke_card: some View {
        RoundedRectangle(cornerRadius: 20, style: .continuous)
            .stroke()
            .foregroundStyle(.linearGradient(colors: [.white.opacity(0.8), .white.opacity(0.1)], startPoint: .topLeading, endPoint: .bottomTrailing))
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
