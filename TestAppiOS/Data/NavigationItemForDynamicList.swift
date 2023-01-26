//
//  Artwork.swift
//  TestAppiOS
//
//  Created by Полина Данилова on 31.12.2022.
//

import Foundation

struct NavigationItemForDynamicList : Identifiable, Hashable {
    var id = UUID()
    var title: String
    var icon: String
    var menu : Menu
}

var navItemsForDynamic = [
    NavigationItemForDynamicList(title:"Compass App", icon: "safari", menu: .compass),
    NavigationItemForDynamicList(title:"3D Card", icon: "lanyardcard", menu: .card),
    NavigationItemForDynamicList(title:"Radial Layout", icon: "clock", menu: .radial),
    NavigationItemForDynamicList(title:"Gooey Action Button", icon: "plus.circle", menu: .actionbutton),
    NavigationItemForDynamicList(title:"Gooey Menu", icon: "drop", menu: .gooey),
    NavigationItemForDynamicList(title:"Charts", icon: "chart.xyaxis.line", menu: .charts),
    NavigationItemForDynamicList(title: "Half Sheet", icon: "rectangle.bottomhalf.filled", menu: .halfsheet),
]
                   
enum Menu : String {
    case compass
    case card
    case charts
    case radial
    case halfsheet
    case gooey
    case actionbutton
}
