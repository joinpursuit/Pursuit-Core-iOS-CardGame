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
  
  // data
  var cards = MatchingGame.getCards()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    cards = cards.shuffled()
    for (index, cardButton) in allCardButtons.enumerated() {
      cardButton.tag = index
    }
  }
  
  @IBAction func flippedCard(_ cardButton: UIButton) {
    let card = cards[cardButton.tag]
    allCardButtons[cardButton.tag].setImage(card.image, for: .normal)
  }

}
