//
//  NavigationView.swift
//  TestAppiOS
//
//  Created by Полина Данилова on 18.01.2023.
//
import SwiftUI

struct MyNavigationView : View{
    var body: some View{
        NavigationView {
            List {
                NavigationLink {
                    CodeDesign()
                } label: {
                    Text("Open DesignCode")
                } .padding(.vertical, 9)
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
        MyNavigationView()
    }
}
