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
    @State private var dealMode: Bool = false
    
    var body: some View {
        VStack {
            Toggle("Deal mode", isOn: $dealMode).padding()
            if dealMode {
                InferenceDealView(pbnGame: board)
            } else {
                PBNGameView(pbnGame: board)
            }
        }
    }
}

struct BoardView_Previews: PreviewProvider {
    static var previews: some View {
        BoardView(board: ModelData().boards[0])
    }
}
