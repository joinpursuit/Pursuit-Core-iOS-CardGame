//
//  ThreeCardMonteController.swift
//  CardGame
//
//  Created by Alex Paul on 11/12/18.
//  Copyright © 2018 Alex Paul. All rights reserved.
//

import UIKit

class ThreeCardMonteController: UIViewController {
  
  @IBOutlet var allCardButtons: [UIButton]!
  @IBOutlet weak var winningStatusLabel: UILabel!
  @IBOutlet weak var newGameButton: UIButton!
  
  // getting data from the ThreeCardMonte model
  var cards = ThreeCardMonte.getCards(numberOfCards: 3)
  
  override func viewDidLoad() {
    super.viewDidLoad()
    cards = cards.shuffled()
  }

  @IBAction func flippedCard(_ cardButton: UIButton) {
    let card = cards[cardButton.tag]
    allCardButtons[cardButton.tag].setImage(card.image, for: .normal)
    if !card.isWinningCard {
      for (index, card) in cards.enumerated() {
        if card.image == UIImage(named: ThreeCardMonteImageName.kingCard) {
          allCardButtons[index].setImage(card.image, for: .normal)
          break
        }
      }
    }
    winningStatusLabel.text = card.isWinningCard ? "You won!" : "You lost!"
    allCardButtons.forEach { $0.isEnabled = false }
  }
  
  @IBAction func newGame(_ newGameButton: UIButton) {
    winningStatusLabel.text = "Pick a card"
    cards = cards.shuffled()
    for cardButton in allCardButtons {
      cardButton.isEnabled = true
      cardButton.setImage(UIImage(named: "cardBackRed"), for: .normal)
    }
  }
}
