// https://github.com/Quick/Quick

import Quick
import Nimble
import ScryfallApiSwift

class TableOfContentsSpec: QuickSpec {
    override func spec() {
        describe("ScryfallApi") {
            it("does fetch a random card") {
                var fetched = false
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
                waitUntil { done in
                    repeat {
                        Thread.sleep(forTimeInterval: 0.5)
                    } while(fetched == false)

                    expect(fetched) == true

                    done()
                }
            }
        }

//        describe("these will fail") {
//
//            it("can do maths") {
//                expect(1) == 2
//            }
//
//            it("can read") {
//                expect("number") == "string"
//            }
//
//            it("will eventually fail") {
//                expect("time").toEventually( equal("done") )
//            }
//
//            context("these will pass") {
//
//                it("can do maths") {
//                    expect(23) == 23
//                }
//
//                it("can read") {
//                    expect("🐮") == "🐮"
//                }
//
//                it("will eventually pass") {
//                    var time = "passing"
//
//                    DispatchQueue.main.async {
//                        time = "done"
//                    }
//
//                    waitUntil { done in
//                        Thread.sleep(forTimeInterval: 0.5)
//                        expect(time) == "done"
//
//                        done()
//                    }
//                }
//            }
//        }
    }
}
