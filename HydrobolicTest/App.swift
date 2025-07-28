//
//  HydrobolicTestApp.swift
//  HydrobolicTest
//
//  Main application scene.
//

import AppKit

@main
class App: NSObject, NSApplicationDelegate {

    var windows: [NSWindow] = []

    func applicationDidFinishLaunching(_ notification: Notification) {
        windows = [
            StencilWindow(useCustomControls: true, appearance: .aqua),
            StencilWindow(useCustomControls: true, appearance: .darkAqua),
            StencilWindow(useCustomControls: false),
        ]

        let screen = NSScreen.main!.visibleFrame
        let frame = CGSize(width: 450, height: 280)

        var x = screen.minX + (screen.width - frame.width * CGFloat(windows.count)) / 2.0
        let y = screen.minY + (screen.height - frame.height) / 2.0
        for window in windows {
            window.orderFront(nil)
            window.setFrameOrigin(.init(x: x, y: y))
            x += frame.width
        }
    }

    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        return true
    }

    func createMenu() -> NSMenu {
        let menu = NSMenu(title: "Main Menu")

        let applicationMenu = NSMenuItem()
        applicationMenu.submenu = NSMenu()
        applicationMenu.submenu?.addItem(withTitle: "About", action: #selector(NSApplication.orderFrontStandardAboutPanel(_:)), keyEquivalent: "")
        applicationMenu.submenu?.addItem(NSMenuItem.separator())
        applicationMenu.submenu?.addItem(withTitle: "Quit", action: #selector(NSApplication.terminate(_:)), keyEquivalent: "q")
        menu.addItem(applicationMenu)

        return menu
    }

    static func main() {
        let app = NSApplication.shared
        let delegate = App()
        app.delegate = delegate
        app.mainMenu = delegate.createMenu()
        _ = NSApplicationMain(CommandLine.argc, CommandLine.unsafeArgv)
    }
}
