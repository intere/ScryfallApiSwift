//
//  ScryfallApi.swift
//  ScryfallApiSwift
//
//  Created by Eric Internicola on 3/28/20.
//

import Foundation

open class ScryfallApi {
    public typealias RandomCardResult = (Result<Card, Error>) -> Void
    public typealias AutoCompleteResult = (Result<AutoComplete, Error>) -> Void

    public init() {
        
    }

    /// Fetches a random card for you.
    /// - Parameter completion: Calls back with the result of the random card.
    open func randomCard(completion: @escaping RandomCardResult) -> CancellableTask {
        return ScryfallResources.randomCard.fetch(completion: completion)
    }

    /// Performs an "autocompletion" for you.  Calls back with a list of cards that are autocompletion candidates
    /// for the text you provide.
    /// - Parameters:
    ///   - text: The text to auto-complete.
    ///   - completion: Calls back with the result of the auto completion.
    open func autocompleteCard(text: String, completion: @escaping AutoCompleteResult) -> CancellableTask {
        return ScryfallResources.autocompleteCard(text).fetch(completion: completion)
    }
}

// MARK: - Resource types

extension ScryfallApi {

    struct ScryfallResources {
        static let randomCard = Resource<Card>(url: URL(string: "https://api.scryfall.com/cards/random")!, postData: nil)

        static func autocompleteCard(_ text: String) -> Resource<AutoComplete> {
            let escapedText = text.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? text
            let url = URL(string: "https://api.scryfall.com/cards/autocomplete?q=\(escapedText)")!
            return Resource<AutoComplete>(url: url, postData: nil)
        }
    }

}
