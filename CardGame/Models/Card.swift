//
//  Card.swift
//  CardGame
//
//  Created by Alex Paul on 11/12/18.
//  Copyright © 2018 Alex Paul. All rights reserved.
//

import UIKit

protocol Card {
  var image: UIImage { get }
  static func getCards(numberOfCards: Int) -> [Self]
}
