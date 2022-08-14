import SwiftUI
import MbSwiftUIFirstResponder
struct TextEditorApproachView: View {
  
  enum FirstResponders: Int {
      case text
  }
  
  @State private var text: String?
  @State var firstResponder: FirstResponders? = BulbTest.TextEditorApproachView.FirstResponders.text
  
  let placeholder = "Enter Text Here"
  
  init() {
    UITextView.appearance().backgroundColor = .clear
  }
  
  var body: some View {
    VStack {
      ScrollView {
        ZStack(alignment: .topLeading) {
          Color.gray
            .opacity(0.3)
            .clipShape(RoundedRectangle(cornerRadius: 12))
          
          Text(text ?? placeholder)
            .padding()
            .opacity(text == nil ? 1 : 0)
          TextEditor(text: Binding($text, replacingNilWith: ""))
            .firstResponder(id: FirstResponders.text, firstResponder: $firstResponder, resignableUserOperations: .all)
            .frame(minHeight: 30, alignment: .leading)
            .cornerRadius(6.0)
            .multilineTextAlignment(.leading)
            .padding(9)
            .onAppear{
              print(firstResponder)
            }
            .onChange(of: self.text) { newValue in
              print(firstResponder)
            }
        }
      }
    }
  }
}

struct TextEditorApproachView_Previews: PreviewProvider {
  static var previews: some View {
    TextEditorApproachView()
  }
}

public extension Binding where Value: Equatable {
  
  init(_ source: Binding<Value?>, replacingNilWith nilProxy: Value) {
    self.init(
      get: { source.wrappedValue ?? nilProxy },
      set: { newValue in
        if newValue == nilProxy {
          source.wrappedValue = nil
        } else {
          source.wrappedValue = newValue
        }
      }
    )
  }
}

//extension TextEditor {
//    public func firstResponder<V: Hashable>(id: V, firstResponder: Binding<V?>, resignableUserOperations: MbFirstResponder.TextEditor.ResignableUserOperations = .all) -> some View {
//        self
//            .background(MbFRHackView<V, UITextView>(id: id, firstResponder: firstResponder, resignableUserOperations: resignableUserOperations))
//    }
//}
