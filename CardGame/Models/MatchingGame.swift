//
//  MatchingGame.swift
//  CardGame
//
//  Created by Alex Paul on 11/12/18.
//  Copyright © 2018 Alex Paul. All rights reserved.
//

import UIKit

public struct MatchingGameName {
  static let pokemonCardBack = "pokemonCardBack"
}

enum Pokemon: String, CaseIterable {
  case pokemonCardBlueRed
  case pokemonCardGreen
  case pokemonCardHeart
  case pokemonCardMoon
  case pokemonCardRed
  case pokemonCardYellowBlack
  
  // instance
  public func image() -> UIImage {
    var cardImage: UIImage!
    switch self {
    case .pokemonCardBlueRed:
      cardImage = UIImage(named: Pokemon.pokemonCardBlueRed.rawValue)
    case .pokemonCardGreen:
      cardImage = UIImage(named: Pokemon.pokemonCardGreen.rawValue)
    case .pokemonCardHeart:
      cardImage = UIImage(named: Pokemon.pokemonCardHeart.rawValue)
    case .pokemonCardMoon:
      cardImage = UIImage(named: Pokemon.pokemonCardMoon.rawValue)
    case .pokemonCardRed:
      cardImage = UIImage(named: Pokemon.pokemonCardRed.rawValue)
    case .pokemonCardYellowBlack:
      cardImage = UIImage(named: Pokemon.pokemonCardYellowBlack.rawValue)
    }
    return cardImage
  }
}

// final indicates no other class can subclass MatchingGame
final class MatchingGame: Card, Equatable {
  // properties
  var image: UIImage
  var tag: Int
  var isMatched: Bool
  
  // initializer
  init(image: UIImage) {
    self.image = image
    self.isMatched = false
    self.tag = 0
  }
  
  // methods
  static func == (lhs: MatchingGame, rhs: MatchingGame) -> Bool {
    return lhs.image == rhs.image
  }
  
  static func play(cardPair: [MatchingGame]) -> Bool {
    var foundAPair = false
    guard let cardOne = cardPair.first,
      let cardTwo = cardPair.last else { return foundAPair }
    if cardOne == cardTwo {
      foundAPair = true
    }
    return foundAPair
  }
  
  static func getCards(numberOfCards: Int = 0) -> [MatchingGame] {
    var cards = [MatchingGame]()
    for pokemon in Pokemon.allCases {
      for _ in 0...1 { // create two cards for each image
        let card = MatchingGame(image: pokemon.image())
        cards.append(card)
      }
    }
    return cards
  }
}
