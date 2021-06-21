//
//  Player.swift
//  DurakGame
//
//  Created by Дима Носко on 15.06.21.
//

import Foundation

protocol PlayerBaseCompatible {
    var hand: [Card]? { get set }
}

final class Player: PlayerBaseCompatible {
    var hand: [Card]?

    func checkIfCanTossWhenAttacking(card: Card) -> Bool {
        return hand?.filter { $0.value == card.value }.count ?? 0 > 0
    }

    func checkIfCanTossWhenTossing(table: [Card: Card]) -> Bool {
        guard let hand = hand else { return false }
        let myHand = Set(hand.map { $0.value })
        return myHand.intersection(table.keys.map { $0.value }).count > 0 || myHand.intersection(table.values.map { $0.value }).count > 0
    }
}
