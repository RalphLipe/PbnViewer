//
//  ContentView.swift
//  PbnViewer
//
//  Created by Ralph Lipe on 4/25/23.
//

import SwiftUI
import ContractBridgeUI
import ContractBridge

extension PBNGame: Identifiable {
    public var id: Int { return self.board! }
}

struct ContentView: View {
    @EnvironmentObject var modelData: ModelData
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(modelData.boards) {
                        board in
                        NavigationLink(destination: BoardView(board: board)) {
                            Text("Board \(board.board!)")
                        }
                    }
                }
            }
        }
        .padding().navigationTitle("Boards")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
