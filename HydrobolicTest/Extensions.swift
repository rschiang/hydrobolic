//
//  Extensions.swift
//  HydrobolicTest
//
//  Convenience functions for various UI building operations.
//

import AppKit

extension NSStackView {

    /// Creates and returns a stack view with the specified layout settings.
    /// - Parameters:
    ///   - orientation: The horizontal or vertical layout direction of the stack view.
    ///   - alignment: The view alignment within the stack view.
    ///   - spacing: The minimum spacing, in points, between adjacent views in the stack view.
    convenience init(_ orientation: NSUserInterfaceLayoutOrientation,
                     alignment: NSLayoutConstraint.Attribute,
                     distribution: NSStackView.Distribution = .gravityAreas,
                     spacing: CGFloat = 8.0, views: [NSView]? = nil) {
        if (views != nil) {
            self.init(views: views!)
        } else {
            self.init()
        }
        self.orientation = orientation
        self.alignment = alignment
        self.distribution = distribution
        self.spacing = spacing
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

extension NSTabView {

    func addTabViewItem(_ label: String, view: NSView? = nil) {
        let item = NSTabViewItem()
        item.label = label
        item.view = view
        self.addTabViewItem(item)
    }
}

extension NSButton {
    convenience init(radioButtonWithTitle: String, state: NSControl.StateValue = .off, action: Selector? = nil) {
        self.init(radioButtonWithTitle: radioButtonWithTitle, target: nil, action: action)
        self.state = state
        self.translatesAutoresizingMaskIntoConstraints = false
    }

    convenience init(checkboxWithTitle: String, state: NSControl.StateValue = .off) {
        self.init(checkboxWithTitle: checkboxWithTitle, target: nil, action: nil)
        self.state = state
        self.translatesAutoresizingMaskIntoConstraints = false
    }

    convenience init(title: String, keyEquivalent: String? = nil) {
        self.init()
        self.title = title
        if (keyEquivalent != nil) {
            self.keyEquivalent = keyEquivalent!
        }
        self.translatesAutoresizingMaskIntoConstraints = false
    }

    convenience init(bezelStyle: NSButton.BezelStyle, title: String = "") {
        self.init()
        self.bezelStyle = bezelStyle
        self.title = title
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

extension NSView {
    func setMinimumSizeConstraint(width: CGFloat = 0, height: CGFloat = 0) {
        if (width > 0) {
            self.widthAnchor.constraint(greaterThanOrEqualToConstant: width).isActive = true
        }
        if (height > 0) {
            self.heightAnchor.constraint(greaterThanOrEqualToConstant: height).isActive = true
        }
    }
}
