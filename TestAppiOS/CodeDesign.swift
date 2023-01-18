//
//  CodeDesign.swift
//  TestAppiOS
//
//  Created by Полина Данилова on 18.01.2023.
//

import SwiftUI

struct CodeDesign: View {
    var body: some View {
        VStack(alignment: .center, spacing: 20){
            Image(systemName: "timelapse", variableValue: 0.6)
                .imageScale(.large)
                .font(.largeTitle)
                .foregroundColor(.accentColor)
                .fontWeight(.thin)
            Text("Switching app".uppercased())
                .font(.largeTitle.width(.condensed))
                .fontWeight(.bold)
            Text("Yes, we accept PayPal for the one-year plan only. Purchasing through PayPal will not renew your subscription at the end of your one-year period.")
                .multilineTextAlignment(.center)
                .foregroundColor(.secondary)
                .fontWeight(.medium)
            Button{
                
            } label: {
                Text("Got it!")
                    .padding(.all)
                    .frame(maxWidth: .infinity)
                    .background(.clear.gradient)
                    .cornerRadius(10)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke()
                            .foregroundStyle(.linearGradient(colors: [.white.opacity(0.9), .gray.opacity(0.3) ], startPoint: .top, endPoint: .bottom)))
                    
//                    .foregroundStyle(.secondary))
            }
//          если установить фиксированный цвет, то он не будет меняться в зависимости от темы, но если праймери, то подстраивается под те у
            .accentColor(.primary)
        }
        .padding(30)
        .background(.ultraThinMaterial)
        .cornerRadius(10)
        .overlay(RoundedRectangle(cornerRadius: 10).stroke().foregroundStyle(.linearGradient(colors: [.white.opacity(1), .gray.opacity(0.4) ], startPoint: .top, endPoint: .bottom)))
        .padding(20)
        .background(
            Image("TheirdBackImage")
                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(maxHeight: .infinity)
                                .edgesIgnoringSafeArea(.all)
        )
    }
}

struct CodeDesign_Previews: PreviewProvider {
    static var previews: some View {
        CodeDesign()
//            .background(Image("DarkBackImage"))
    }
}
