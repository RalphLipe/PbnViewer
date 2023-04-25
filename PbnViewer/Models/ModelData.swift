//
//  ModelData.swift
//  PbnViewer
//
//  Created by Ralph Lipe on 4/25/23.
//

import Foundation
import ContractBridge
final class ModelData: ObservableObject {
    @Published var boards: [PBNGame]
    init() {
        boards = []
        if let path = Bundle.main.path(forResource: "TestData.pbn", ofType: nil) {
            do {
                let data = try String(contentsOfFile: path, encoding: .utf8);
                self.boards = PortableBridgeNotation.load(pbnData: data);
            } catch {
                fatalError("Data file not found.")
            }
        }
    }
}
