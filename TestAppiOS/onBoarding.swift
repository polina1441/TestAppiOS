//
//  onBoarding.swift
//  TestAppiOS
//
//  Created by Полина Данилова on 23.01.2023.
//

import SwiftUI
import RiveRuntime

struct onBoarding: View {
    let button = RiveViewModel(fileName: "button")
    @State var showMessage = false
    
    var body: some View {
        ZStack {
            back
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
                            withAnimation(.easeInOut) {
                                showMessage = !showMessage
                            }
                    }
                    Text("Purchase includes access to 30+ courses, 240+ premium tutorials, 120+ hours of videos, source files and certificates.").font(.footnote)
                        .opacity(0.7)
             }
            .padding(40)
            .padding(.top, 40)
            SignInView()
                .opacity(showMessage ? 1 : 0)
                .offset(y: showMessage ? 0 : 900)
                .scaleEffect(showMessage ? 1 : 0.6)
                .blur(radius: showMessage ? 0 : 18)
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
}

struct onBoarding_Previews: PreviewProvider {
    static var previews: some View {
        onBoarding()
    }
}
