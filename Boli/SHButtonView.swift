//
//  SHButtonView.swift
//  Boli
//
//  Created by 姜柏任 on 2025/7/11.
//

import SwiftUI
import AppKit

struct SHButtonView: View, NSViewRepresentable {

    var useCustomButton: Bool = true

    init(useCustomButton: Bool = true) {
        self.useCustomButton = useCustomButton
    }

    typealias NSViewType = NSButton

    func makeNSView(context: Context) -> NSViewType {
        let nsView = useCustomButton ? SHButton() : NSButton()
        nsView.title = "Hello, World!"
        nsView.image = NSImage(systemSymbolName: "globe", accessibilityDescription: "")
        nsView.bezelStyle = .push
        nsView.controlSize = .regular
        nsView.imagePosition = .imageLeading
        nsView.display()
        return nsView
    }

    func updateNSView(_ nsView: NSViewType, context: Context) {
    }
}

#Preview {
    VStack {
        SHButtonView().fixedSize()
        SHButtonView(useCustomButton: false).fixedSize()
        Button("Hello, World!", systemImage: "globe") {}
        Spacer()
        SHButtonView().fixedSize()
            .scaleEffect(.init(width: 2, height: 2))
    }
    .padding(48)
    .frame(width: 300, height: 280)
}
