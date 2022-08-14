//
//  ContentView.swift
//  MovingChat
//
//  Created by 양유진 on 2022/06/28.
//

import SwiftUI

struct Restaurant: Identifiable {
  var id = UUID()
  var name: String
  var image: String
  var isFavorite: Bool = false
}

extension Restaurant: Equatable {}

struct BasicImageRow: View {
  var restaurant: Restaurant
  var body: some View {
    HStack {
      Text(restaurant.name)
        .foregroundColor(.white)
      if restaurant.isFavorite {
        Spacer()
        Image(systemName: "star.fill")
          .foregroundColor(.yellow)
      }
    }
    .background(Color.blue)
    .padding()
  }
}

struct ContentView: View {
  @State private var restaurants = [
    Restaurant(name: "Cafe Deadend", image: "cafedeadend"),
    Restaurant(name: "Homei", image: "homei"),
    Restaurant(name: "Teakha", image: "teakha"),
    Restaurant(name: "Cafe Loisl", image: "cafeloisl"),
    Restaurant(name: "Petite Oyster", image: "petiteoyster"),
    Restaurant(name: "For Kee Restaurant", image: "forkeerestaurant"),
  ]
  
  var body: some View {
    ScrollView(.vertical, showsIndicators: false){
      LazyVStack(spacing: 15) {
        ForEach(restaurants) { restaurant in
          Button(action: {
            withAnimation {
              var selectedRestaurant = restaurant
              selectedRestaurant.isFavorite.toggle()
              restaurants = restaurants.filter { $0.id != restaurant.id }
              let index = selectedRestaurant.isFavorite ? 0 : restaurants.firstIndex { $0.isFavorite == false }
              restaurants.insert(selectedRestaurant, at: index ?? 0)
            }
          }) {
            BasicImageRow(restaurant: restaurant)
          }.buttonStyle(.automatic)
        }
      }
    }
  }
}
