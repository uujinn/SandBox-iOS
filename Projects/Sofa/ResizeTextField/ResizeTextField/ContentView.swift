//
//  ContentView.swift
//  ResizeTextField
//
//  Created by 양유진 on 2022/07/15.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    Home()
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    Home()
  }
}


struct Home: View{
  
  @State var txt = ""
  @State var height: CGFloat = 0
  @State var keyboardHeight :  CGFloat = 0
  var body: some View{
    VStack(spacing: 0){
      HStack{
        Text("Chats")
          .font(.title)
          .fontWeight(.bold)
        
        Spacer()
      }.padding()
        .background(Color.white)
      
      ScrollView(.vertical, showsIndicators: false) {
        Text("")
      }
      
      ResizeableTF(txt: self.$txt, height: self.$height)
        .frame(height: self.height < 130 ? self.height : 130)
        .padding(.horizontal)
        .background(Color.white)
        .cornerRadius(15)
        .padding(.horizontal)
      
      Spacer()
    }
    .padding(.bottom, self.keyboardHeight)
    .background(Color.black.opacity(0.06).edgesIgnoringSafeArea(.bottom))
//    .onAppear{
//      NotificationCenter.default.addObserver(forName: UIResponder.keyboardDidShowNotification, object: nil, queue: .main) { (data) in
//        let height1 = data.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue
//        self.keyboardHeight = height1.cgRectValue.height - 20
//      }
//    }
  }
}

struct ResizeableTF: UIViewRepresentable {
  
  @Binding var txt: String
  @Binding var height: CGFloat
  
  func makeCoordinator() -> Coordinator {
    return ResizeableTF.Coordinator(parent1: self)
  }
  
  func makeUIView(context: Context) -> UITextView {
    let view = UITextView()
    view.isEditable = true
    view.isScrollEnabled = true
    view.text = "Enter Message"
    view.font = .systemFont(ofSize: 18)
    view.textColor = .gray
    view.backgroundColor = .clear
    view.delegate = context.coordinator
    
    return view
  }
  
  func updateUIView(_ uiView: UITextView, context: Context) {
    DispatchQueue.main.async {
      self.height = uiView.contentSize.height
    }
  }
  
  class Coordinator: NSObject, UITextViewDelegate{
    var parent: ResizeableTF
    
    init(parent1: ResizeableTF){
      parent = parent1
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
      if self.parent.txt == "" {
        textView.text = ""
        textView.textColor = .black
      }
    }
    
    func textViewDidChange(_ textView: UITextView) {
      DispatchQueue.main.async {
        self.parent.height = textView.contentSize.height
        self.parent.txt = textView.text
      }
    }
  }
}
