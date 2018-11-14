//
//  ThreeCardMonte.swift
//  CardGame
//
//  Created by Alex Paul on 11/12/18.
//  Copyright © 2018 Alex Paul. All rights reserved.
//

import UIKit

public struct ThreeCardMonteImageName {
  static let threeCard = "threeCard"
  static let kingCard = "kingCard"
}

// final indicates no other class can subclass ThreeCardMonte
final class ThreeCardMonte: Card {
  // properties
  var image: UIImage
  var isWinningCard: Bool
  
  // initializer
  init(image: UIImage, isWinningCard: Bool) {
    self.image = image
    self.isWinningCard = isWinningCard
  }
  
  // methods
  static func getCards(numberOfCards: Int) -> [ThreeCardMonte] {
    var cards = [ThreeCardMonte]()
    for index in 1...numberOfCards {
      var card: ThreeCardMonte! // implicit unwrap
      if index == 1 {
        card = ThreeCardMonte(image: UIImage(named: ThreeCardMonteImageName.kingCard)!, isWinningCard: true)
      } else {
        card = ThreeCardMonte(image: UIImage(named: ThreeCardMonteImageName.threeCard)!, isWinningCard: false)
      }
      cards.append(card)
    }
    return cards
  }
}
