//
//  HydrobolicTestApp.swift
//  HydrobolicTest
//
//  Main application scene.
//

import SwiftUI

@main
struct HydrobolicTestApp: App {
    var body: some Scene {
        WindowGroup("UI Stencil") {
            StencilView().fixedSize()
        }
        .windowIdealSize(.fitToContent)
        .restorationBehavior(.disabled)
    }
}
