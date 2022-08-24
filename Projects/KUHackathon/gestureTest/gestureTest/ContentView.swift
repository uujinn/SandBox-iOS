////
////  ContentView.swift
////  gestureTest
////
////  Created by 양유진 on 2022/08/14.
////
//
//import SwiftUI
//
//struct ContentView: View {
//  // how far the circle has been dragged
//  @State private var offset = CGSize.zero
//  
//  // whether it is currently being dragged or not
//  @State private var isDragging = false
//  
//  //  @State private var currentAmount = 0.0
//  //  @State private var finalAmount = 1.0
//  //  @State private var currentAmount = Angle.zero
//  //  @State private var finalAmount = Angle.zero
//  
//  @State var width = 200.0
//  @State var height = 250.0
//  @GestureState var press = false
//  @State var completed = false
//  
//  var body: some View {
//    // a drag gesture that updates offset and isDragging as it moves around
//    Rectangle()
//      .frame(width: 200, height: 200, alignment: .center)
//      .modifier(TapAndLongPressModifier(tapAction: { print("tap") },
//                                        longPressAction: { print("long") }))
//    
//    //
//    //
//    //    let dragGesture = DragGesture()
//    //      .onChanged { value in offset = value.translation }
//    //      .onEnded { _ in
//    //        withAnimation {
//    //          offset = .zero
//    //          isDragging = false
//    //          width = 200.0
//    //          height = 250.0
//    //        }
//    //      }
//    //
//    //    // a long press gesture that enables isDragging
//    //    let pressGesture = LongPressGesture()
//    //      .onEnded { value in
//    //        if value == true{
//    //          withAnimation {
//    //            isDragging = true
//    //            width = 400.0
//    //            height = 500.0
//    //          }
//    //        }else{
//    //          withAnimation {
//    //            isDragging = false
//    //            width = 200.0
//    //            height = 250.0
//    //            print("false")
//    //          }
//    //        }
//    //      }
//    //
//    //    // a combined gesture that forces the user to long press then drag
//    //    let combined = pressGesture
//    //
//    //    // a 64x64 circle that scales up when it's dragged, sets its offset to whatever we had back from the drag gesture, and uses our combined gesture
//    //    Rectangle()
//    //      .fill(.black)
//    //      .frame(width: 64, height: 64)
//    //      .scaleEffect(completed ? 3 : 1)
//    //      .offset(offset)
//    //      .onLongPressGesture(minimumDuration: 1.0, maximumDistance: <#T##CGFloat#>, perform: <#T##() -> Void#>, onPressingChanged: <#T##((Bool) -> Void)?##((Bool) -> Void)?##(Bool) -> Void#>)
//    //      .gesture(LongPressGesture()
//    //        .updating($press){ (currentState, gestureState, _) in
//    //          gestureState = currentState
//    //          print(gestureState)
//    //        }
//    //        .onEnded { _ in
//    //          self.completed = true
//    //          DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//    //            self.completed = false
//    //          }
//    //          //self.press.toggle()
//    //        }
//    //      )
//    //    VStack { // high Priority Gesture
//    //      Text("Hello, World!")
//    //        .onTapGesture {
//    //          print("Text tapped")
//    //        }
//    //    }
//    //    .padding()
//    //    .background(Color.blue)
//    //    .highPriorityGesture(
//    //      TapGesture()
//    //        .onEnded { _ in
//    //          print("VStack tapped")
//    //        }
//    //    )
//    //    VStack {
//    //      Text("Hello, World!")
//    //        .onTapGesture {
//    //          print("Text tapped")
//    //        }
//    //    }
//    //    .padding()
//    //    .background(Color.yellow)
//    //    .onTapGesture {
//    //      print("VStack tapped")
//    //    }
//    
//    //    Text("Hello, World!") // scale gesture
//    //      .scaleEffect(finalAmount + currentAmount)
//    //      .gesture(
//    //        MagnificationGesture()
//    //          .onChanged { amount in
//    //            currentAmount = amount - 1
//    //          }
//    //          .onEnded { amount in
//    //            finalAmount += currentAmount
//    //            currentAmount = 0
//    //          }
//    //      )
//    
//    //    Text("Hello, World!") // rotation gesture
//    //        .rotationEffect(currentAmount + finalAmount)
//    //        .gesture(
//    //            RotationGesture()
//    //                .onChanged { angle in
//    //                    currentAmount = angle
//    //                }
//    //                .onEnded { angle in
//    //                    finalAmount += currentAmount
//    //                    currentAmount = .zero
//    //                }
//    //        )
//    
//    //    List{ // tap gesture
//    //      Text("Double")
//    //        .onTapGesture(count: 2) {
//    //          print("Double tapped!")
//    //        }
//    //      Text("Long")
//    //        .onLongPressGesture {
//    //          print("Long pressed!")
//    //        }
//    //
//    //      Text("minimumDuration")
//    //        .onLongPressGesture(minimumDuration: 3) {
//    //          print("Long pressed! (3)")
//    //        } onPressingChanged: { inProgress in
//    //          print("In progress: \(inProgress)!")
//    //        }
//    //    }
//  }
//}
//
//struct ContentView_Previews: PreviewProvider {
//  static var previews: some View {
//    ContentView()
//  }
//}
//
//struct TapAndLongPressModifier: ViewModifier {
//  @State private var isLongPressing = false
//  let tapAction: (()->())
//  let longPressAction: (()->())
//  func body(content: Content) -> some View {
//    content
//      .scaleEffect(isLongPressing ? 3.0 : 1.0)
//      .onLongPressGesture(minimumDuration: 10.0, pressing: { (isPressing) in
//        withAnimation {
//          isLongPressing = isPressing
//          print(isPressing)
//        }
//      }, perform: {
//        longPressAction()
//      })
//      .simultaneousGesture(
//        TapGesture()
//          .onEnded { _ in
//            tapAction()
//          }
//      )
//  }
//}
