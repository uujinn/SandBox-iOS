//
//  Stackoverflow.swift
//  gestureTest
//
//  Created by 양유진 on 2022/08/21.
//

import SwiftUI

struct Stackoverflow: View {
    @Namespace var namespace
    @State private var shown: Bool = false

    var body: some View {
        VStack {
            Button {
                shown.toggle()
            } label: {
                Text("Tap Me!\nI'm a red square.")
                    .multilineTextAlignment(.center)
            }
            .background(
                Color.red
                    .matchedGeometryEffect(id: "1", in: namespace, properties: .frame))
        
            Spacer()
            if shown {
                Color.clear
                    .aspectRatio(contentMode: .fit)
                    .matchedGeometryEffect(id: "1", in: namespace, properties: .size)
                    .border(Color.gray)
            }
            Spacer()
        }
        .animation(.easeInOut(duration: 1))
    }
}

struct Stackoverflow_Previews: PreviewProvider {
    static var previews: some View {
        Stackoverflow()
    }
}
