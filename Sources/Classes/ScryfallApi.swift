//
//  ScryfallApi.swift
//  ScryfallApiSwift
//
//  Created by Eric Internicola on 3/28/20.
//

import Foundation

open class ScryfallApi {
    public typealias RandomCardResult = (Result<Card, Error>) -> Void

    public init() {
        
    }

    /// Fetches a random card for you.
    /// - Parameter completion: The random card to fetch.
    open func randomCard(completion: @escaping RandomCardResult) -> CancellableTask {
        return ScryfallResources.randomCard.fetch(completion: completion)
    }
}

// MARK: - Resource types

extension ScryfallApi {

    struct ScryfallResources {
        static let randomCard = Resource<Card>(url: URL(string: "https://api.scryfall.com/cards/random")!, postData: nil)
    }

}
