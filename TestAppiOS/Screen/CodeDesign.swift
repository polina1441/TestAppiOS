import SwiftUI

struct CodeDesign: View {
    @State var showSheetMenu = false
    @State var selectedMenu : Menu = .compass
    var body: some View{
        ZStack {
            switch selectedMenu {
            case .compass:
                MessageView()
            case .card:
                Text("3D Card")
            case .charts:
                Text("charts")
            case .radial:
                Text("radial")
            case .halfsheet:
                Text("halfsheet")
            case .gooey:
                Text("gooey")
            case .actionbutton:
                Text("actionbutton")
            }
            VStack {
                Spacer()
                Button("Show Button Sheet"){
                    showSheetMenu = true
                }.padding(20)
                .sheet(isPresented: $showSheetMenu){
                    MenuView(selectedMenu: $selectedMenu).presentationDetents([.medium, .large])
            }
            }
        }
    }
}

struct CodeDesign_Previews: PreviewProvider {
    static var previews: some View {
        CodeDesign()
    }
}
