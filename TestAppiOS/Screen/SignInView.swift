//
//  SignInView.swift
//  TestAppiOS
//
//  Created by Полина Данилова on 24.01.2023.
//

import SwiftUI
import RiveRuntime

struct SignInView: View {
    @State var email : String = ""
    @State var password : String = ""
    @State var loading = false
    @Binding var showSignInModal : Bool
    let check = RiveViewModel(fileName: "check", stateMachineName: "State Machine 1")
    let confetti = RiveViewModel(fileName: "confetti", stateMachineName: "State Machine 1")
    
    func logIn() {
        loading = true
        
        if email != "" {
            DispatchQueue.main.asyncAfter(deadline: .now()+1) {
                try? check.triggerInput("Check")
            }
            DispatchQueue.main.asyncAfter(deadline: .now()+2.5) {
                loading = false
            }
            DispatchQueue.main.asyncAfter(deadline: .now()+3) {
                withAnimation(.spring()){
                    showSignInModal = false
                }
            }
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now()+1) {
                try? check.triggerInput("Error")
            }
            DispatchQueue.main.asyncAfter(deadline: .now()+3) {
                loading = false
            }
        }
        
    }
    var body: some View {
        VStack(spacing: 24) {
            Text("Sign in").customFont(.largeTitle).bold()
            Text("Access to 240+ hours of content. Learn design and code, by building real apps with React and Swift.").customFont(.headline)
                .foregroundColor(.secondary)
                .fixedSize(horizontal: false, vertical: true)
            VStack(alignment: .leading) {
                Text("Email").customFont(.subheadline)
                    .foregroundColor(.secondary)
                TextField("", text: $email)
                    .customTextFields()
            }
            VStack {
                HStack {
                    Text("Password").customFont(.subheadline)
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
            Button{
                logIn()
            } label: {
                Label("Sign in", systemImage: "arrow.right")
                    .padding(20)
                    .frame(maxWidth: .infinity)
                    .background(Color(hex: "F77D8E"))
                    .foregroundColor(.white)
                    .cornerRadius(20, corners: [.topRight, .bottomLeft, .bottomRight])
                    .cornerRadius(8, corners: [.topLeft ])
                .shadow(color: Color(hex: "F77D8E").opacity(0.5), radius: 20, x: 0, y: 10)
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
        .padding(.horizontal)
        .padding(.bottom, 50)
        .overlay(
            ZStack{
                if loading {
                    check.view()
                        .frame(width: 100, height: 100)
                        .allowsTightening(false)
                    
                }
//                confetti.view()
//                    .allowsTightening(false)
            }
         )
    }
    var stroke_card: some View {
        RoundedRectangle(cornerRadius: 20, style: .continuous)
            .stroke()
            .foregroundStyle(.linearGradient(colors: [.white.opacity(0.8), .white.opacity(0.1)], startPoint: .topLeading, endPoint: .bottomTrailing))
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView(showSignInModal: .constant(true))
    }
}
