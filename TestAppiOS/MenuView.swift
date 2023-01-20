//
//  MenuView.swift
//  TestAppiOS
//
//  Created by Полина Данилова on 20.01.2023.
//

import SwiftUI

struct MenuView: View {
    @Binding var selectedMenu : Menu
    
    var body: some View {
        List(navItemsForDynamic) { item in
            Button {
                selectedMenu = item.menu
            } label: {
                Label(item.title, systemImage: item.icon)
                    .foregroundColor(.primary)
                .padding(8)
            }
        }.listStyle(.plain)
        
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView(selectedMenu: .constant(.compass))
    }
}
