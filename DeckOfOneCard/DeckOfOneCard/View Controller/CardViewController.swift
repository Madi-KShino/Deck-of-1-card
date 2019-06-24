//
//  CardViewController.swift
//  DeckOfOneCard
//
//  Created by Madison Kaori Shino on 6/24/19.
//  Copyright © 2019 Madi S. All rights reserved.
//

import UIKit

class CardViewController: UIViewController {

    @IBOutlet weak var cardImageView: UIImageView!
    @IBOutlet weak var suitLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var codeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func drawButtonTapped(_ sender: Any) {
        CardController.drawCard { (card) in
            if let card = card {
                CardController.getImageFor(card: card, completion: { (image) in
                    if let image = image {
                        DispatchQueue.main.async {
                            self.cardImageView.image = image
                            self.suitLabel.text = card.suit
                            self.valueLabel.text = card.value
                            self.codeLabel.text = card.code
                        }
                    }
                })
            }
        }
    }
}
