//
//  PbnViewerApp.swift
//  PbnViewer
//
//  Created by Ralph Lipe on 4/25/23.
//

import SwiftUI

@main
struct PbnViewerApp: App {
    @StateObject private var modelData = ModelData();
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(modelData)
        }
    }
}
