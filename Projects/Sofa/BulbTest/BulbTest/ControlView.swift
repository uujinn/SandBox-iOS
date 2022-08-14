//
//  ControlView.swift
//  BulbTest
//
//  Created by 양유진 on 2022/07/10.
//

import Foundation
import SwiftUI


struct ControlView: View {
  @Environment(\.presentationMode) var presentationMode
  @Binding var lightIsOn: Bool
  var body: some View {
    VStack(spacing: 20.0) {
      Button(action: {
        lightIsOn.toggle()
        self.presentationMode.wrappedValue.dismiss()
      }, label: {
        Image(systemName: !lightIsOn ? "bolt.circle.fill" : "bolt.slash.circle.fill" )
          .font(.system(size: 60))
      })
      Text("Turn the light bulb \(!lightIsOn ? "on" : "off")")
        .fontWeight(.bold)
    }
    .navigationTitle("Control Room")
  }
}

struct ControlView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      ControlView(lightIsOn: .constant(true))
    }
  }
}
