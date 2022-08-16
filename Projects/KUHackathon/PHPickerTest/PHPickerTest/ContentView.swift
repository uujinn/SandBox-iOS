//
//  ContentView.swift
//  PHPickerTest
//
//  Created by 양유진 on 2022/08/16.
//

import SwiftUI
import PhotosUI
import AVKit

struct ContentView: View {
  @State private var player: AVPlayer?
  @State var selectedImage: UIImage?
  @State var showImagePicker: Bool = false
  @State private var mediaItems = [UIImage]() // will hold selected photos, is not saved directly to Core Data
//  @State private var videoItem = Video

  @State private var isPresented = false
  @State private var showingAlert = false
  
  var body: some View {
    ZStack{
      VStack{
        VideoPlayer(player: player)
        getSelectedImage(selected: selectedImage)
          .resizable()
          .scaledToFit()
          .frame(width: 400, height: 400, alignment: .center)
//        List(mediaItems, id: \.self) { item in
//             Image(uiImage: item)
//                 .resizable()
//                 .aspectRatio(contentMode: .fit)
//                 .onAppear{
//                   print("mediaImages: \(mediaItems)")
//                 }
//         }
        HStack{
          Button {
            DispatchQueue.main.async {
              self.showImagePicker = true
            }
            
          } label: {
            Text("앨범")
          }
          Button {
            DispatchQueue.main.async {
              self.isPresented.toggle()
            }
            
          } label: {
            Text("동영상")
          }
        }
      }
    }
    .sheet(isPresented: $showImagePicker) {
//      PhotoPicker(mediaItems: $mediaItems, showPicker: $showImagePicker) { didSelectItems in
//        showImagePicker = false
//      }
      PhotoPicker(selectedImage: $selectedImage)
    }
    .sheet(isPresented: $isPresented, content: videoPicker)


  }
  
  private func getSelectedImage(selected image: UIImage?) -> Image {
      guard let uiImage = image else {
          return Image(systemName: "")
      }
      return Image(uiImage: uiImage)
  }
  
  private func videoPicker() -> VideoPicker {
      var configuration = PHPickerConfiguration()
      configuration.selectionLimit = 1
      configuration.preferredAssetRepresentationMode = .current
      configuration.filter = .videos
      
      return VideoPicker(configuration: configuration, isPresented: $isPresented, player: $player, showingAlert: $showingAlert)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
