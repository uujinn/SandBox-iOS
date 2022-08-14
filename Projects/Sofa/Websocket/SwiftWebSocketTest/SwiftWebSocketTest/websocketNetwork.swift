
import SwiftWebSocket

var webSocket: WebSocket?
var opened = false
var connected = false

private func openWebSocket(urlString: String) {
  if let url = URL(string: urlString) {
    var request = URLRequest(url: url)
    
    // Add custom header parameters if necessary
    //        request.addCustomHeaders()
    
    let webSocket = WebSocket(request: request)
    
    webSocket.event.open = { [weak self] in
      self?.opened = true
    }
    
    webSocket.event.close = { [weak self] (code, reason, clean) in
      guard let self = self else { return }
      self.webSocket = nil
      self.connected = false
      self.opened = false
    }
    self.webSocket = webSocket
  } else {
    webSocket = nil
  }
}


openWebSocket(urlString: "")

webSocket.event.message = { [weak self] message in
  guard let self = self else { return }
  
  if let message = message as? String, let messageType = self.getMessageType(from: message) {
    switch(messageType) {
    case .connected:
      self.connected = true
      self.subscribeToServer(with: productID)
    case .tradingQuote:
      let currentQuote = self.getCurrentQuoteResponse(from: message)
      print("Current value of selected stock \(currentQuote.price)")
    }
  }
}


private func subscribeToServer(with productID: String) {
    let subscriptionPayload = self.subscriptionPayload(for: productID)
    webSocket.send(subscriptionPayload)
}


func unsubscribeFromQuote(for productID: String) {
    let payload = ["unsubscribeFrom": ["trading.product.\(productID)"]]
    if let jsonData = try? JSONSerialization.data(withJSONObject: payload, options: []) {
        if let jsonPayload = String(data: jsonData, encoding: .utf8) {
            webSocket?.send(jsonPayload)
        }
    }
}
