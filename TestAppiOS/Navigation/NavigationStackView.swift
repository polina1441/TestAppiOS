//
//  NavigationStackView.swift
//  TestAppiOS
//
//  Created by Полина Данилова on 20.01.2023.
//

import SwiftUI

struct NavigationStackView: View {
    var body: some View {
        NavigationStack {
            List(navItemsForDynamic) { item in
                NavigationLink(value: item) {
                    Label(item.title, systemImage: item.icon)
                        .foregroundColor(.primary)
                }
            }
            .navigationDestination(for: NavigationItemForDynamicList .self){item in
                switch item.menu {
                case .compass:
                        Text(item.title)
                case .card:
                        Text(item.title)
                case .charts:
                    Text(item.title)
                case .radial:
                    Text(item.title)
                case .halfsheet:
                    Text(item.title)
                case .gooey:
                    Text(item.title)
                case .actionbutton:
                    Text(item.title)
                }
                
            }
//            .navigationTitle("I don't no")
            .navigationBarTitleDisplayMode(.inline)
            .listStyle(.inset)
        }
    }
}

struct NavigationStackView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStackView()
    }
}
