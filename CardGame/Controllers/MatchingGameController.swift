//
//  MatchingGameController.swift
//  CardGame
//
//  Created by Alex Paul on 11/12/18.
//  Copyright © 2018 Alex Paul. All rights reserved.
//

import UIKit

class MatchingGameController: UIViewController {
  
  @IBOutlet var allCardButtons: [UIButton]!
  @IBOutlet weak var resetGameButton: UIButton!
  
  // getting data from the MatchingGame model
  var cards = MatchingGame.getCards()
  
  // using a computed property when our cardPair array has a count of 2, we check if it's a matching pair
  var cardPair = [MatchingGame]() {
    didSet {
      if cardPair.count == 2 { checkForPair() }
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    resetGame(resetGameButton)
  }
  
  @IBAction func flippedCard(_ cardButton: UIButton) {
    let card = cards[cardButton.tag]
    allCardButtons[cardButton.tag].setImage(card.image, for: .normal)
    if cardPair.count < 2 {
      let results = cardPair.filter { $0.tag == card.tag }
      if results.count == 0 { cardPair.append(card) }
    }
  }
  
  private func checkForPair() {
    let foundPair = MatchingGame.play(cardPair: cardPair)
    if foundPair {
      guard let cardOne = cardPair.first,
        let cardTwo = cardPair.last else { return }
      cards[cardOne.tag].isMatched = true
      cards[cardTwo.tag].isMatched = true
      allCardButtons[cardOne.tag].isEnabled = false
      allCardButtons[cardTwo.tag].isEnabled = false
    } else {
      allCardButtons.forEach { $0.isUserInteractionEnabled = false }
      
      // we have some new concepts here
      // Timer.scheduledTimer is a type method on Timer class that creates and calls a function after the specified delay, in our case 2 seconds
      // target: self - indicates that the function will be in this instance of the MatchingGameController
      // selector: #selector(turnCardsFaceDown) is where we indicate the name of the function to be called after the delay has been reached
      // userInfo: we are setting to nil as we are not passing any additional info
      // repeats: this indicated if the call should be repeated, in our case we set it to false
      Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(turnCardsFaceDown), userInfo: nil, repeats: false)
    }
    cardPair.removeAll() // remove all elements from the cardPair array
  }
  
  @objc private func turnCardsFaceDown() {
    allCardButtons.forEach { $0.isUserInteractionEnabled = true }
    for (index, card) in cards.enumerated() {
      if !card.isMatched {
        allCardButtons[index].setImage(UIImage(named: MatchingGameName.pokemonCardBack), for: .normal)
      }
    }
  }
  
  @IBAction func resetGame(_ resetGameButton: UIButton) {
    cards = cards.shuffled()
    for (index, cardButton) in allCardButtons.enumerated() {
      cards[index].tag = index
      cardButton.tag = index
      cardButton.isEnabled = true
      cardButton.setImage(UIImage(named: MatchingGameName.pokemonCardBack), for: .normal)
    }
  }
}
