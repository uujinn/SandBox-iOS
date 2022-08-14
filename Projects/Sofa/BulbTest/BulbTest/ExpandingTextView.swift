//
//  ExpandingTextView.swift
//  BulbTest
//
//  Created by 양유진 on 2022/07/12.
//

import SwiftUI

struct ExpandingTextView: View {
  @Binding var text: String
  let minHeight: CGFloat = 150
  @State private var height: CGFloat?

  var body: some View {
    WrappedTextView(text: $text, textDidChange: self.textDidChange)
      .frame(height: height ?? minHeight)
      .background(Color.gray)
  }

  private func textDidChange(_ textView: UITextView) {
    self.height = max(textView.contentSize.height, minHeight)
  }
}
