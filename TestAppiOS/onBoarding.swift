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
    var body: some View {
        ZStack {
            back
            button.view()
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
}

struct onBoarding_Previews: PreviewProvider {
    static var previews: some View {
        onBoarding()
    }
}
