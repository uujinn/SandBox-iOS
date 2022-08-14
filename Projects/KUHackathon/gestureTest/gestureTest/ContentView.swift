//
//  ContentView.swift
//  gestureTest
//
//  Created by 양유진 on 2022/08/14.
//

import SwiftUI

struct ContentView: View {
  // how far the circle has been dragged
  @State private var offset = CGSize.zero

  // whether it is currently being dragged or not
  @State private var isDragging = false
  
  //  @State private var currentAmount = 0.0
  //  @State private var finalAmount = 1.0
  //  @State private var currentAmount = Angle.zero
  //  @State private var finalAmount = Angle.zero
  
  
  var body: some View {
    // a drag gesture that updates offset and isDragging as it moves around
    let dragGesture = DragGesture()
      .onChanged { value in offset = value.translation }
      .onEnded { _ in
        withAnimation {
          offset = .zero
          isDragging = false
        }
      }
    
    // a long press gesture that enables isDragging
    let pressGesture = LongPressGesture()
      .onEnded { value in
        withAnimation {
          isDragging = true
        }
      }
    
    // a combined gesture that forces the user to long press then drag
    let combined = pressGesture.sequenced(before: dragGesture)
    
    // a 64x64 circle that scales up when it's dragged, sets its offset to whatever we had back from the drag gesture, and uses our combined gesture
    Circle()
      .fill(.red)
      .frame(width: 64, height: 64)
      .scaleEffect(isDragging ? 1.5 : 1)
      .offset(offset)
      .gesture(combined)
    //    VStack { // high Priority Gesture
    //      Text("Hello, World!")
    //        .onTapGesture {
    //          print("Text tapped")
    //        }
    //    }
    //    .padding()
    //    .background(Color.blue)
    //    .highPriorityGesture(
    //      TapGesture()
    //        .onEnded { _ in
    //          print("VStack tapped")
    //        }
    //    )
    //    VStack {
    //      Text("Hello, World!")
    //        .onTapGesture {
    //          print("Text tapped")
    //        }
    //    }
    //    .padding()
    //    .background(Color.yellow)
    //    .onTapGesture {
    //      print("VStack tapped")
    //    }
    
    //    Text("Hello, World!") // scale gesture
    //      .scaleEffect(finalAmount + currentAmount)
    //      .gesture(
    //        MagnificationGesture()
    //          .onChanged { amount in
    //            currentAmount = amount - 1
    //          }
    //          .onEnded { amount in
    //            finalAmount += currentAmount
    //            currentAmount = 0
    //          }
    //      )
    
    //    Text("Hello, World!") // rotation gesture
    //        .rotationEffect(currentAmount + finalAmount)
    //        .gesture(
    //            RotationGesture()
    //                .onChanged { angle in
    //                    currentAmount = angle
    //                }
    //                .onEnded { angle in
    //                    finalAmount += currentAmount
    //                    currentAmount = .zero
    //                }
    //        )
    
    //    List{ // tap gesture
    //      Text("Double")
    //        .onTapGesture(count: 2) {
    //          print("Double tapped!")
    //        }
    //      Text("Long")
    //        .onLongPressGesture {
    //          print("Long pressed!")
    //        }
    //
    //      Text("minimumDuration")
    //        .onLongPressGesture(minimumDuration: 3) {
    //          print("Long pressed! (3)")
    //        } onPressingChanged: { inProgress in
    //          print("In progress: \(inProgress)!")
    //        }
    //    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
