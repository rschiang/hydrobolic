//
//  StencilWindow.swift
//  HydrobolicTest
//
//  Displays the UI stencil.
//

import AppKit

class StencilWindow : NSWindow {

    init(useCustomControls: Bool = false, scale: CGFloat = 1.0, appearance: NSAppearance.Name? = .none) {
        super.init(contentRect: .zero, styleMask: [.titled, .closable, .miniaturizable], backing: .buffered, defer: false)
        self.title = "UI Stencil"
        if (appearance != .none) {
            self.appearance = NSAppearance(named: appearance!)
        }

        let viewController = StencilViewController()
        viewController.useCustomControls = useCustomControls
        viewController.scale = scale
        self.contentViewController = viewController
    }

}

class StencilViewController : NSViewController {

    var window: NSWindow? { self.view.window }
    var contentView: StencilView?
    var useCustomControls: Bool = false
    var scale: CGFloat = 1.0

    override func loadView() {
        let view = NSView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        self.view = view
        if (scale > 1.0) {
            view.scaleUnitSquare(to: .init(width: scale, height: scale))
        }

        let contentView = StencilView(useCustomControls: useCustomControls)
        self.contentView = contentView
        view.addSubview(contentView)
    }

    override func viewDidAppear() {
        let bounds = contentView!.bounds
        window!.setContentSize(.init(width: bounds.width * scale, height: bounds.height * scale))
        window!.makeFirstResponder(contentView?.initialFirstResponder)
    }
}
