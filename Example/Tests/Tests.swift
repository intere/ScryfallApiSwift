// https://github.com/Quick/Quick

import Quick
import Nimble
import ScryfallApiSwift

class TableOfContentsSpec: QuickSpec {
    override func spec() {
        describe("ScryfallApi") {
            var fetched = false

            func waitForFetch() {
                waitUntil { done in
                    repeat {
                        Thread.sleep(forTimeInterval: 0.5)
                    } while(fetched == false)

                    expect(fetched) == true

                    done()
                }
            }

            it("does autocomplete") {
                fetched = false

                _ = ScryfallApi().autocompleteCard(text: "jace") { result in
                    switch result {
                    case .success(let result):
                        expect(result.data.count).toNot(equal(0))
                    case .failure(let error):
                        expect(error).to(beNil())
                        print(error.localizedDescription)
                    }
                    fetched = true
                }
                waitForFetch()
            }

            it("does get empty result on 1 character") {
                fetched = false

                _ = ScryfallApi().autocompleteCard(text: "j") { result in
                    switch result {
                    case .success(let result):
                        expect(result.data.count).to(equal(0))
                    case .failure(let error):
                        expect(error).to(beNil())
                        print(error.localizedDescription)
                    }
                    fetched = true
                }
                waitForFetch()
            }


            it("does fetch a random card") {
                fetched = false

                _ = ScryfallApi().randomCard { result in
                    switch result {
                    case .success(let card):
                        print("Got random card: \(card.name)")
                    case .failure(let error):
                        expect(error).to(beNil())
                        print(error.localizedDescription)
                    }
                    fetched = true
                }

                waitForFetch()
            }

        }
    }
}
