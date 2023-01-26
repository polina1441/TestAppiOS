//
//  NavigationView.swift
//  TestAppiOS
//
//  Created by Полина Данилова on 18.01.2023.
//
import SwiftUI

struct MainRootNavigationView : View{
    var body: some View{
        NavigationStack {
            List{
                NavigationLink() {
                    ContentView()
                } label: {
                    Label("Ian Solomein Lesson", systemImage: "arrowtriangle.right.circle")
                }
            .padding(.vertical, 9)
                NavigationLink() {
                    CodeDesign()
                } label: {
                    Label("DesignCode Lesson 1", systemImage: "book")
                }.padding(.vertical, 9)
                NavigationLink() {
                    onBoarding()
                } label: {
                    Label("Rive Animation", systemImage: "bolt.heart")
                }.padding(.vertical, 9)
                 .navigationTitle("Learn Swift UI")}
            .toolbar {
                ToolbarItem {
                    Button(action: {}) {
                        Image(systemName: "timelapse")
                            .imageScale(.large)
                            .font(.title2)
                    }
                }
            }
        }
    }
}


struct NavigationView_Previews: PreviewProvider {
    static var previews: some View {
        MainRootNavigationView().dynamicTypeSize(.xSmall ... .xxxLarge)
    }
}

