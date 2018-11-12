//
//  MatchingGame.swift
//  CardGame
//
//  Created by Alex Paul on 11/12/18.
//  Copyright © 2018 Alex Paul. All rights reserved.
//

import UIKit

enum Pokemon: String, CaseIterable {
  case pokemonCardBlueRed
  case pokemonCardGreen
  case pokemonCardHeart
  case pokemonCardMoon
  case pokemonCardRed
  case pokemonCardYellowBlack
}

final class MatchingGame: Card {
  var image: UIImage
  
  init(image: UIImage) {
    self.image = image
  }
  
  static func getCards(numberOfCards: Int = 0) -> [MatchingGame] {
    var cards = [MatchingGame]()
    for pokemon in Pokemon.allCases {
      for _ in 0...1 { // duplicate x 2 image
        let card = MatchingGame(image: UIImage(named: pokemon.rawValue)!)
        cards.append(card)
      }
    }
    return cards
  }
  
}
