//
//  WebSocket.swift
//  StarsCreamTest
//
//  Created by 양유진 on 2022/08/02.
//

import Foundation
import SwiftUI
import Combine

final class ChatScreenViewModel: ObservableObject {
  
  private var websocketTask: URLSessionWebSocketTask?
  let uid = UUID().uuidString
  
  @Published private(set) var messages: String = ""
  
  func connect() {
    guard let url = URL(string: "ws://localhost:1337/") else {
      print("Error: can not create URL")
      return
    }
    var request = URLRequest(url: url)
    request.addValue("Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJLQUtBTzoyMTczNzMzODA0IiwiaWF0IjoxNjU4MDM4NzA0LCJleHAiOjE2NjU4MTQ3MDR9.Cm1pEFN83ribamFh36WdnSTJI74Crmy2T9XmxElwr1Q", forHTTPHeaderField: "Authorization")
//    let url = URL(string: "ws://3.34.94.220:8085/home/1/1")!
//    websocketTask = URLSession.shared.webSocketTask(with: url)
    websocketTask = URLSession.shared.webSocketTask(with: request)
//    websocketTask?.receive(completionHandler: onReceive)
//    receiveMessage()
    websocketTask?.resume()
    receiveMessage()
    print("connect!")
  }
  
  func disconnect() {
    websocketTask?.cancel(with: .normalClosure, reason: nil)
  }
  

  func isSelf(_ id: String) -> Bool {
    id == uid
  }
  
  func receiveMessage() {
    websocketTask?.receive { result in
      switch result {
      case .failure(let error):
        print("Error in receiving message: \(error)")
      case .success(let message):
        switch message {
        case .string(let text):
          print("Received string: \(text)")
        case .data(let data):
          print("Received data: \(data)")
        }
        
        self.receiveMessage()
      }
    }
  }
  
  private func onMessage(message: URLSessionWebSocketTask.Message) {
    if case .string(let text) = message {
      
      //            guard let data = text.data(using: .utf8),
      //                    let chatMessage = try? JSONDecoder().decode(ReceivingChatMessage.self, from: data)
      //            else {
      //                return
      //            }
      
      // because URLSessionWebSocketTask can call the receive handler on a different thread,
      // hence we have to ensure we update UI in main thread
      //            DispatchQueue.main.async {
      //                self.messages.append(chatMessage)
      //            }
    }
  }
  
  deinit { // 9
    disconnect()
  }
}
