//
//  onBoarding.swift
//  TestAppiOS
//
//  Created by Полина Данилова on 23.01.2023.
//

import SwiftUI
import RiveRuntime

struct onBoarding: View {
    
    @State var showSignInModal = false
    let button = RiveViewModel(fileName: "button")
    
    var body: some View {
        ZStack {
            back
            content
                .padding(40)
                .padding(.top, 40)
                .offset(y: showSignInModal ? -28 : 0)
            Color("Shadow")
                .ignoresSafeArea()
                .opacity(showSignInModal ? 0.3 : 0.0)
            
            if (showSignInModal){
                SignInView(showSignInModal: .constant(showSignInModal))
                    .padding(0)
                    .opacity(showSignInModal ? 1 : 0)
                    .offset(y: showSignInModal ? 0 : 1000)
                    .scaleEffect(showSignInModal ? 1 : 0.6)
                    .blur(radius: showSignInModal ? 0 : 18)
                    .overlay {
                        Button {
                            withAnimation(.spring()) {
                                showSignInModal = !showSignInModal
                            }
                        } label: {
                            Image(systemName: "xmark")
                                .frame(width: 40,height: 40)
                                .foregroundColor(.black)
                                .background(.white)
                                .cornerRadius(30, corners: .allCorners)
                                .shadow(color: Color("Shadow").opacity(0.5), radius: 5, x: 0, y: 3)
                        }.frame(maxHeight: .infinity, alignment: .bottomLeading)
                            .padding(.bottom, 30)
                    }.zIndex(1)
            }
        }
    }
    var back: some View {
        RiveViewModel(fileName: "shapes").view()
            .ignoresSafeArea()
            .blur(radius: 27)
            .background(
                Image("Spline")
                    .blur(radius: 50)
                    .offset(x: 200, y: 100  )
        )
    }
    var content: some View {
        VStack(alignment: .leading, spacing: 16) {
                Text("Learn design & code")
                    .font(.custom("Poppins Bold", size: 60, relativeTo: .largeTitle))
                    .frame(width: 260, alignment: .leading)
                Text("Don’t skip design. Learn design and code, by building real apps with React and Swift. Complete courses about the best tools.")
                    .customFont(.body)
                    .opacity(0.7)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Spacer()
                button
                    .view()
                    .frame(width: 234, height: 64)
                    .overlay(
                        Label("Start a course", systemImage: "arrow.forward")
                            .offset(x: 4, y: 4)
                            .font(.headline)
                    )
                    .background(
                        Color.black
                            .cornerRadius(40)
                            .blur(radius: 10)
                            .opacity(0.3)
                            .offset(y: 15)
                    )
                    .onTapGesture{
                        button.play(animationName: "active")
                        DispatchQueue.main.asyncAfter(deadline: .now()+0.8) {
                            withAnimation(.spring()) {
                                showSignInModal = !showSignInModal
                            }
                        }
                }
                Text("Purchase includes access to 30+ courses, 240+ premium tutorials, 120+ hours of videos, source files and certificates.").font(.footnote)
                    .opacity(0.7)
         }
    }
}

struct onBoarding_Previews: PreviewProvider {
    static var previews: some View {
        onBoarding()
    }
}
