//
//  BannerView.swift
//  EventPager
//
//  Created by 양유진 on 2022/06/29.
//

import SwiftUI
import SwiftUIPager

struct BannerView: View {
  @StateObject var page: Page = .first()
  @State var alignment: ExamplePositionAlignment = .start
  var items = Array(0..<3)
  
  var body: some View {
    Pager(page: page,
          data: items,
          id: \.self,
          content: { index in
      // create a page based on the data passed
      Text("hi: \(index)")
        .frame(width: 318, height: 100, alignment: .center)
        .background(.yellow)
    })
    .onPageChanged({ (newIndex) in
      if newIndex == 0 {
        withAnimation {
          self.alignment = .justified
        }
      }
      else if newIndex == 1{
        withAnimation {
          self.alignment = .justified
        }
      }
      else if newIndex == 2 {
        withAnimation {
          self.alignment = .end
        }
      }
      
    })
    .alignment(PositionAlignment(alignment: self.alignment))
    .singlePagination(ratio: 0.33, sensitivity: .custom(0.5))
    .preferredItemSize(CGSize(width: 318, height: 100))
    .itemSpacing(16)
    .background(Color.black.opacity(0.1))
    
  }
}

enum ExamplePositionAlignment: String, CaseIterable{
  case start
  case justified
  case end
}

extension PositionAlignment {
  init(alignment: ExamplePositionAlignment) {
    switch alignment {
    case .start:
      self = .start(16)
    case .end:
      self = .end(16)
    case .justified:
      self = .justified(16)
    }
  }
}


struct BannerView_Previews: PreviewProvider {
  static var previews: some View {
    BannerView()
  }
}
