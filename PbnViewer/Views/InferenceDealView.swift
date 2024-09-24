import SwiftUI
import CardInference
import ContractBridge


public struct InferenceDealView: View {
    @StateObject private var viewModel: InferenceDealViewModel
    
    public init(pbnGame: PBNGame) {
        _viewModel = StateObject(wrappedValue: InferenceDealViewModel(pbnGame: pbnGame))
    }
    
    public var body: some View {
        VStack {
            if viewModel.showArrow {
                DirectionArrowView(direction: viewModel.dealDirection)
                    .padding()
            } else {
                Circle()
                    .fill(Color.gray)
                    .frame(width: 50, height: 50)
                    .padding()
            }

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
        .onAppear {
            viewModel.startInference()
        }
        .onDisappear {
            viewModel.stopInference()
        }
    }
}

struct DirectionArrowView: View {
    let direction: Position
    
    var body: some View {
        Image(systemName: direction.arrowImageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 50, height: 50)
            .foregroundStyle(Color(Color.gray))
    }
}

extension Position {
    var arrowImageName: String {
        switch self {
        case .north: return "arrow.up"
        case .east: return "arrow.right"
        case .south: return "arrow.down"
        case .west: return "arrow.left"
        }
    }
}
