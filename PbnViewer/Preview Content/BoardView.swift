//
//  BoardView.swift
//  PbnViewer
//
//  Created by Ralph Lipe on 4/25/23.
//

import SwiftUI
import ContractBridge
import ContractBridgeUI

struct BoardView: View {
    var board: PBNGame
    
    var body: some View {
        // TODO: JAMES LIPE.  ADD STUFF TO DEAL A HAND HERE...
        // Instead of just showing the data use the board.deal.hands
        // to show an arrow for the direction where the card can go.
        PBNGameView(pbnGame: board)
    }
}

struct BoardView_Previews: PreviewProvider {
    static var previews: some View {
        BoardView(board: ModelData().boards[0])
    }
}
