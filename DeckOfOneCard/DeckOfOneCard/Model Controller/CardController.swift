//
//  CardController.swift
//  DeckOfOneCard
//
//  Created by Madison Kaori Shino on 6/24/19.
//  Copyright © 2019 Madi S. All rights reserved.
//

import Foundation
import UIKit

class CardController {
    
    static let baseURL = URL(string: "https://deckofcardsapi.com/api/deck/new/draw/?count=1")
    
    //drawCard func is taking in another func called completion (whih takes in an optional Card url and returns nothing)
    static func drawCard(completion: @escaping (Card?) -> Void) {
        //1. unwrap the optional base url
        guard let url = baseURL else { completion(nil); return }
        //2. construct the final url (ex: appending anything to the url)
        //3. create a url request to get data from
//        let request = URLRequest(url: url)
        //4. get the data from the url request
        do {
            let data = try Data(contentsOf: url)
            let jsdecoder = JSONDecoder()
            let topLevelJson = JSONDecoder.decode(TopLevelJSON.self, from: data)
            let card = topLevelJson.cards[0]
            completion(card)
        } catch {
            print("error getting data from url")
            completion(nil)
            return
        }
    }
    
    
    static func getImageFor(card: Card, completion: (UIImage?) ->()) {
        //1.
        guard let url = URL(string: card.image) else { completion(nil); return }
        //2.
        //3.
        //4.
        do {
            let data = try Data(contentsOf: url)
            let image = UIImage(data: data)
            completion(image)
        } catch {
            print("error fetching image for \(card.code)")
            completion(nil)
            return
        }
    }
}
