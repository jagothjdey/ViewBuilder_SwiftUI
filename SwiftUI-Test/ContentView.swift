import SwiftUI

struct ContentView: View {
    
    var body: some View {
        var myString: String = "Welcome to SwiftUI"
        
        return MyHStack{
            Text("Text 1")
            Text("Text 2")
            MyVStack {
                Image(systemName: "star.fill")
                Image(systemName: "star.fill")
                Image(systemName: "star")
            }
        }
    }
}

struct StandardTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .background(Color.white)
            .border(Color.gray, width: 0.2)
            .shadow(color: Color.black, radius: 5, x: 0, y: 5)
    }
}


struct MyHStack<Content : View>: View{
    let content : () -> Content
    
    init(@ViewBuilder content : @escaping () -> Content) {
        self.content = content
    }
    
    var body : some View{
        HStack{
            content()
        }
    }
}

struct MyVStack<Content: View>: View {
    let content: () -> Content
    
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
    
    var body: some View {
        VStack(spacing: 10) {
            content()
        }
        .font(.largeTitle)
    }
}
