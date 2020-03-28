//
//  Card.swift
//  ScryfallApiSwift
//
//  Created by Eric Internicola on 3/28/20.
//

import Foundation

public struct Card: Codable {
    public let object: String
    public let id: String
    public let name: String
    public let lang: String
    public let releasedAt: String?
    public let uri: String
    public let scryfallURI: String?
    public let layout: String
    public let highresImage: Bool?
    public let imageUris: ImageUris?
    public let manaCost: String?
    public let cmc: Int
    public let typeLine: String?
    public let oracleText: String?
    public let power: String?
    public let toughness: String?
    public let colors: [String]
    public let colorIdentity: [String]?
    public let legalities: [String: String]
    public let foil: Bool
    public let nonfoil: Bool
    public let oversized: Bool
    public let promo: Bool
    public let reprint: Bool
    public let variation: Bool
    public let cardSet: String?
    public let setName: String?
    public let setType: String?
    public let setURI: String?
    public let digital: Bool
    public let rarity: String
    public let cardBackID: String?
    public let artist: String
    public let artistIDS: [String]?
    public let illustrationID: String?
    public let borderColor: String?
    public let frame: String
    public let fullArt: Bool?
    public let textless: Bool
    public let booster: Bool
    public let storySpotlight: Bool?
    public let edhrecRank: Int?
    public let prices: CardPrices?
    public let relatedUris: RelatedUris?
    public let purchaseUris: PurchaseUris?
}

// MARK: - ImageUris

public struct ImageUris: Codable {
    public let small: String
    public let normal: String
    public let large: String
    public let png: String
    public let artCrop: String
    public let borderCrop: String
}

// MARK: - CardPrices

public struct CardPrices: Codable {
    public let usd: String?
    public let usdFoil: String?
    public let eur: String?
    public let tix: String?
}

// MARK: - RelatedUris

public struct RelatedUris: Codable {
    public let gatherer: String
    public let tcgplayerDecks: String
    public let edhrec: String
    public let mtgtop8: String
}

// MARK: - PurchaseUris

public struct PurchaseUris: Codable {
    public let tcgplayer: String
    public let cardmarket: String
    public let cardhoarder: String
}
