import SwiftUI

struct CodeDesign: View {
    @State var time = 0.0
    @State var showMessage = true
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack(alignment: .center, spacing: 20){
            content
                .opacity(showMessage ? 1 : 0)
                .offset(y: showMessage ? 0 : 900)
                .scaleEffect(showMessage ? 1 : 0.6)
                .blur(radius: showMessage ? 0 : 18)
        }
        .padding(20)
        .background(
            Image("TheirdBackImage")
                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(maxHeight: .infinity)
                                .edgesIgnoringSafeArea(.all)
        )
        .dynamicTypeSize(.xSmall ... .xxxLarge)
    }
    
    var content: some View {
        VStack(alignment: .center, spacing: 20){
            Image(systemName: "timelapse", variableValue: time)
                .imageScale(.large)
                .font(.system(size: 50))
                .foregroundColor(.accentColor)
                .fontWeight(.thin)
                .onReceive(timer) { value in
                    if (time < 1.0){
                        time += 0.1
                    } else {
//                        time = 0.0
                    }
                }
            Text("Switching app".uppercased())
                .font(.largeTitle.width(.condensed))
                .fontWeight(.bold)
            Text("Yes, we accept PayPal for the one-year plan only. Purchasing through PayPal will not renew your subscription at the end of your one-year period")
                .multilineTextAlignment(.center)
                .foregroundColor(.secondary)
                .fontWeight(.medium)
            Button{
                withAnimation(.easeInOut) {
                    showMessage = !showMessage
                }
            } label: {
                Text("Got it!")
                    .padding(.all)
                    .frame(maxWidth: .infinity)
                    .background(.clear.gradient)
                    .cornerRadius(10)
                    .background(stroke_button)
            }
            .accentColor(.primary)
            .shadow(radius: 6)
        }
        .padding(30)
        .background(.ultraThinMaterial.opacity(0.9))
        .cornerRadius(10)
        .overlay(stroke_card)
        .frame(maxWidth: 600)
        .shadow(color: .blue.opacity(0.2) ,radius: 18)
    }
    var stroke_button: some View {
        RoundedRectangle(cornerRadius: 10)
            .stroke()
            .foregroundStyle(.linearGradient(colors: [.white.opacity(0.9), .gray.opacity(0.3) ], startPoint: .top, endPoint: .bottom))
    }
    var stroke_card: some View {
        RoundedRectangle(cornerRadius: 10).stroke().foregroundStyle(.linearGradient(colors: [.white.opacity(1), .gray.opacity(0.3), .white.opacity(1), .gray.opacity(0.3) ], startPoint: .topLeading, endPoint: .bottomTrailing))
    }
}

struct CodeDesign_Previews: PreviewProvider {
    static var previews: some View {
        CodeDesign()
    }
}
