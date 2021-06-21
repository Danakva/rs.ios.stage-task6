import Foundation

protocol DeckBaseCompatible: Codable {
    var cards: [Card] {get set}
    var type: DeckType {get}
    var total: Int {get}
    var trump: Suit? {get}
}

enum DeckType:Int, CaseIterable, Codable {
    case deck36 = 36
}

struct Deck: DeckBaseCompatible {

    //MARK: - Properties

    var cards = [Card]()
    var type: DeckType
    var trump: Suit?

    var total:Int {
        return type.rawValue
    }
}

extension Deck {

    init(with type: DeckType) {
        self.type = type
        self.cards = createDeck(suits: Suit.allCases, values: Value.allCases)
    }

    public func createDeck(suits:[Suit], values:[Value]) -> [Card] {
        var cards = [Card]()
        for suit in suits {
            for value in values {
                cards.append(.init(suit: suit, value: value))
            }
        }
        return cards
    }

    public mutating func shuffle() {
        self.cards.shuffle()
    }

    public mutating func defineTrump() {
        guard let lastEl = cards.last else { return }
        let trumpSuit = lastEl.suit
        trump = trumpSuit
        for i in 0..<cards.count {
            cards[i].isTrump = cards[i].suit == trumpSuit
        }
    }

    public mutating func initialCardsDealForPlayers(players: [Player]) {
        guard cards.count >= players.count * 6 else { return }
        players.forEach { player in
            player.hand = Array(cards.prefix(6))
            cards.removeFirst(6)
        }
    }

    public func setTrumpCards(for suit:Suit) {

    }
}

