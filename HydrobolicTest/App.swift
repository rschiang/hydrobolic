//
//  HydrobolicTestApp.swift
//  HydrobolicTest
//
//  Main application scene.
//

import AppKit

@main
class App: NSObject, NSApplicationDelegate {

    var window: NSWindow!

    func applicationDidFinishLaunching(_ notification: Notification) {
        window = StencilWindow(scale: 2)
        window.makeKeyAndOrderFront(nil)
        window.center()
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
