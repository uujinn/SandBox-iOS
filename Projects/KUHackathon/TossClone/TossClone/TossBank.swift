//
//  TossBank.swift
//  TossClone
//
//  Created by 양유진 on 2022/08/19.
//

import SwiftUI

struct Bookmark: Identifiable {
    let id = UUID()
    let name: String
    let icon: String
    var items: [Bookmark]?

    // some example websites
    static let apple = Bookmark(name: "Apple", icon: "1.circle")
    static let bbc = Bookmark(name: "BBC", icon: "square.and.pencil")
    static let swift = Bookmark(name: "Swift", icon: "bolt.fill")
    static let twitter = Bookmark(name: "Twitter", icon: "mic")

    // some example groups
    static let example1 = Bookmark(name: "Favorites", icon: "star", items: [Bookmark.apple, Bookmark.bbc, Bookmark.swift, Bookmark.twitter])
    static let example2 = Bookmark(name: "Recent", icon: "timer", items: [Bookmark.apple, Bookmark.bbc, Bookmark.swift, Bookmark.twitter])
    static let example3 = Bookmark(name: "Recommended", icon: "hand.thumbsup", items: [Bookmark.apple, Bookmark.bbc, Bookmark.swift, Bookmark.twitter])
}

struct TossBank: View {
  let items: [Bookmark] = [.example1, .example2, .example3]
  @State var expand = false
  var body: some View {
//    List(items, children: \.items){ row in
//      Image(systemName: row.icon)
//      Text(row.name)
//    }
    ScrollViewReader{ scrollView in
      ScrollView(.vertical){
        VStack(spacing: 20){
            ForEach(0..<5, id: \.self){ note in
              if note == 0{
                HStack{
                  VStack{
                    Text("토스뱅크 대출,")
                    Text("드디어 열렸어요")
                  }
                  Spacer()
                }
              }else{
                VStack{
                  Image(systemName: "airplane")
                }
                .padding(50)
                .background(Color.gray)
                .cornerRadius(15)
                .onTapGesture {
                  if note == 2{
                    scrollView.scrollTo(7)
                  }
                  withAnimation(.easeInOut(duration: 1)) {
                      expand.toggle()
                  }
                }
                
                if expand{
                  VStack{
                    Image(systemName: "plus")
                  }
                  .padding(50)
                  .background(Color.gray)
                  .cornerRadius(15)
                  .onTapGesture {
                    if note == 2{
                      scrollView.scrollTo(7)
                    }
                    expand = true
                  }
                }
              }
            }
        }
      }//ScrollView
    }
  }
}

struct TossBank_Previews: PreviewProvider {
  static var previews: some View {
    TossBank()
  }
}
