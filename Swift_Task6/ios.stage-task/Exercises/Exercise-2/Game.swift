//
//  Game.swift
//  DurakGame
//
//  Created by Дима Носко on 16.06.21.
//

import Foundation

protocol GameCompatible {
    var players: [Player] { get set }
}

struct Game: GameCompatible {
    var players: [Player]
}

extension Game {

    func defineFirstAttackingPlayer(players: [Player]) -> Player? {
        players.sorted { first, last in
            let firstCard = first.hand?.filter { $0.isTrump }.sorted { $0.value.rawValue < $1.value.rawValue }.first?.value
            let lastCard = last.hand?.filter { $0.isTrump }.sorted { $0.value.rawValue < $1.value.rawValue }.first?.value
            return firstCard?.rawValue ?? 0 < lastCard?.rawValue ?? 0
        }.first
    }
}
