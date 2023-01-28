//
//  MainStorageView.swift
//  TestAppiOS
//
//  Created by Полина Данилова on 28.01.2023.
//

import SwiftUI

struct MainStorageView: View {
    
    @AppStorage("selectedTab") var selectedTab : Tab = .chat
    
    var body: some View {
        ZStack {
            switch selectedTab {
            case .chat:
                Text("Chat")
            case .search:
                Text("Search")
            case .timer:
                Text("Timer")
            case .bell:
                Text("Bell")
            case .user:
                Text("User")
            }
            TabBar()
        }
    }
}

struct MainStorageView_Previews: PreviewProvider {
    static var previews: some View {
        MainStorageView()
    }
}
