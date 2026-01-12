import SwiftUI

let array = ["✌", "✊", "✋"]
struct PSSAppView: View {
    @State var isShowGame =  false
    var body: some View {
        if isShowGame {
            GameView(isShowGame: $isShowGame)
                .transition(.move(edge: .bottom))
        } else {
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Text("PSS Game")
                    Spacer()
                }
                Button(action: {
                    withAnimation {
                        isShowGame.toggle()
                    }
                }) {
                    Text("Enter")
                }.buttonStyle(.borderedProminent)
                Spacer()
            }
            .background(.white)
            .transition(.move(edge: .bottom))
        }
    }
    

}

#Preview {
    PSSAppView()
}
