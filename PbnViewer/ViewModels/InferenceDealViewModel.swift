import SwiftUI
import CardInference
import ContractBridge

class InferenceDealViewModel: ObservableObject {
    @Published var dealDirection: Position = .north
    @Published var showArrow: Bool = false
    
    private var pbnGame: PBNGame
    private var cardInference = CardInference()
    
    init(pbnGame: PBNGame) {
        self.pbnGame = pbnGame
        setupCardInference()
    }
    
    private func setupCardInference() {
        cardInference.setup()
        cardInference.inferenceCallback = { [weak self] result in
            DispatchQueue.main.async {
                self?.processInference(result: result)
            }
        }
    }
    
    func startInference() {
        print("Starting inference")
        cardInference.startInference()
        print("Inference started")
    }
    
    func stopInference() {
        print("Stopping inference")
        cardInference.stopInference()
        self.showArrow = false
        print("Inference stopped")
    }
    
    private func processInference(result: CardInferenceResult?) {
        guard let result = result else {
            self.showArrow = false
            return
        }
        
        if let card = createCard(suit: result.suitString, rank: result.rankString) {
            updateDealDirection(for: card)
        } else {
            print("Failed to create card")
            self.showArrow = false
        }
    }
    
    private func updateDealDirection(for card: Card) {
        print("Updating deal direction for card: \(card)")
        guard let dealInstance = pbnGame.deal else {
            print("No deal available")
            self.showArrow = false
            return
        }
        
        do {
            self.dealDirection = try dealInstance.positionFor(card: card)
            print("Deal direction updated: \(self.dealDirection)")
            self.showArrow = true
        } catch DealError.cardNotFoundInAnyHand {
            print("Card not found in any hand")
            self.showArrow = false
        } catch {
            print("Unexpected error: \(error)")
            self.showArrow = false
        }
    }
    
    private func createCard(suit: String, rank: String) -> Card? {
        guard let suit = Suit(from: suit),
              let rank = Rank(from: rank) else {
            return nil
        }
        return Card(rank, suit)
    }
}
