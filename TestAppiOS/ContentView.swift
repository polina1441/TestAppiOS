//
//  ContentView.swift
//  TestAppiOS
//
//  Created by Полина Данилова on 06.06.2022.
//

import SwiftUI

struct ContentView: View {
    
    var colors = ["black", "yellow", "pink", "blue", "green"]
    @State private var selectedColor = 02
    
    @State private var showHello = true // toggle
    
    @State private var showDetail = false // button
    
    @State private var name = ""
    @State private var password = ""
    @State private var age : Double = 0
    
    var body: some View {
        
        VStack{
            Toggle(isOn: $showHello){
                Text("Show hello")
            }.padding()
            if (showHello) {
                VStack(alignment: .leading ){
                    Text("Hello, \(name)").font(.title2)
                    Text("Your password: \(password)")
                    Text("Your age: \(age)")
                }
            }
            TextField("Enter your name", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            SecureField("Enter your password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal, 16.0)
            Spacer()
            Slider(value: $age, in: 1...100, step: 1){
                Text("Age")
            }minimumValueLabel: {
                Text("1").font(.title2).fontWeight(.thin)
            } maximumValueLabel: {
                Text("100").font(.title2).fontWeight(.thin)
            }.tint(.blue)
                .padding()
                .accessibilityLabel("Age")
                .accessibilityHint("Your age")
            Spacer()
            Button {
                self.showDetail.toggle()
            } label: {
                Text("Show details")
            }
            .padding(.vertical, 16.0)
            .padding(.horizontal, 60.0)
            .background(.thickMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 30))
            if showDetail {
                Text("это проект создан для изучения Свифта...")
            }
            Picker("Favorite Color", selection: $selectedColor, content: {
                ForEach(0..<colors.count){
                    Text(self.colors[$0])
                }
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
