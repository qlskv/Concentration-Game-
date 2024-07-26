//
//  Concentration.swift
//  Concentration
//
//  Created by bin on 2021/06/25.
//

import Foundation

class Concentration
{
    //var cards = Array<Card>()
    var cards = [Card]()
    
    func chooseCard(at index: Int)
    {
        if cards[index].isFaceUp {
            cards[index].isFaceUp = false
        } else {
            cards[index].isFaceUp = true
        }
    }
    
    
    //_ 외부이름을 주지말고 일회성 호출
    init(numberOfPairsOfCards: Int) {
        for _ in 1 ... numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
            
        }
        // TODO: Shuffle the cards
    }
}
