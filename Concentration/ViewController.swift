//
//  ViewController.swift
//  Concentration
//
//  Created by bin on 2021/06/25.
//

import UIKit

class ViewController: UIViewController
{
    //사용할 때 초기화 didSet { } 불가
    lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
    
    
    
    var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flips :\(flipCount)"

        }//속성감시자 속성이 실행될 때 마다 코드 실행
        //flipcount 바뀔때마다
        //UI와 인스턴스변수 싱크 맞춤.
    }
    //속성 = 인스턴스변수
    //인스터스변수 즉 속성 초기화 값 필요
    
    //아울렛 인스턴스 변수
    // 액션 메소드
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBOutlet var cardButtons: [UIButton]!
    
    
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.index(of: sender) {
            
            game.chooseCard(at: cardNumber)
            updateviewFromModel ()
            print("cardNumber = \(cardNumber)")

        } else {
            print("chosen card was not in cardButtons")
        }
    }
    
    func updateviewFromModel () {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp{
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            }
            else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched? #colorLiteral(red: 0.370555222, green: 0.3705646992, blue: 0.3705595732, alpha: 0.9288855546) #colorLiteral(red: 0.370555222, green: 0.3705646992, blue: 0.3705595732, alpha: 0.9288855546)

            }
        }
    }
    
    var emojiChoices = ["🎃","👻","🎃","👻"]
    
    var emoji = [Int:String]()
    func emoji(for card: Card) -> String {
        
        if emoji[card.identifier] != nil, emojiChoices.count > 0 {
            if emoji[card.identifier] == nil {
            let randomIndex = arc4random_uniform(UInt32(emojiChoices.count))
            emoji[card.identifier] = emojiChoices.remove(at: Int(randomIndex))
            }
        }
        
        return emoji[card.identifier] ?? "?"
        
    }
    
}

