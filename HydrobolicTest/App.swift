//
//  HydrobolicTestApp.swift
//  HydrobolicTest
//
//  Main application scene.
//

import Cocoa

@main
class App: NSObject, NSApplicationDelegate {

    var window: NSWindow!

    func applicationDidFinishLaunching(_ notification: Notification) {
        window = NSWindow()
        window.title = "UI Stencil"
        window.styleMask = [.titled, .closable, .miniaturizable]

        let view = SHStencilView()
        window.setContentSize(view.fittingSize)
        window.contentView = view
        window.makeFirstResponder(nil)

        window.makeKeyAndOrderFront(nil)
        window.center()
    }

    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        return true
    }

    static func main() {
        let app = NSApplication.shared
        let delegate = App()
        app.delegate = delegate
        _ = NSApplicationMain(CommandLine.argc, CommandLine.unsafeArgv)
    }
}
