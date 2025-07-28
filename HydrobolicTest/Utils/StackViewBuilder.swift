//
//  StackViewBuilder.swift
//  HydrobolicTest
//
//  Utility class to help build a NSStackView.
//

import AppKit

/// Helper class to build a `NSStackView` with various alignment constraints.
@MainActor
class StackViewBuilder {
    var stackView: NSStackView
    var keyItem: NSView?
    var alignedItems: [NSView] = []

    /// Creates and returns a `StackViewBuilder` with the specified `NSStackView` settings.
    /// - Parameters:
    ///   - orientation: The horizontal or vertical layout direction of the stack view.
    ///   - alignment: The view alignment within the stack view.
    ///   - distribution: The item distribution within the stack view.
    init(_ orientation: NSUserInterfaceLayoutOrientation = .horizontal, alignment: NSLayoutConstraint.Attribute = .notAnAttribute, distribution: NSStackView.Distribution = .gravityAreas) {
        stackView = NSStackView()
        stackView.orientation = orientation
        stackView.translatesAutoresizingMaskIntoConstraints = false
        if (alignment != .notAnAttribute) {
            stackView.alignment = alignment
        }
        if (distribution != .gravityAreas) {
            stackView.distribution = distribution
        }
    }

    /// Adds the specified view to the `NSStackView` without arranging it.
    func addUnmanagedSubview(_ view: NSView) -> StackViewBuilder {
        stackView.addSubview(view)
        return self
    }

    /// Adds the specified view to the list of subviews arranged by `NSStackView` while setting the specified `view` as the key view. Subviews added through `addAlignedSubview` will match the width of this view.
    func addKeySubview(_ view: NSView) -> StackViewBuilder {
        keyItem = view
        stackView.addArrangedSubview(view)
        return self
    }

    /// Adds the specified view to the list of subviews arranged by `NSStackView`.
    func addArrangedSubview(_ view: NSView) -> StackViewBuilder {
        stackView.addArrangedSubview(view)
        return self
    }

    /// Adds the specified view to the list of subviews arranged by `NSStackView`. This view will align to the width of the previously-set key view.
    func addAlignedSubview(_ view: NSView) -> StackViewBuilder {
        alignedItems.append(view)
        stackView.addArrangedSubview(view)
        return self
    }

    /// Builds the constraint and returns the `NSStackView`.
    func build(additionalConstraints: [NSLayoutConstraint]? = nil) -> NSStackView {
        if (keyItem != nil) {
            for item in alignedItems {
                item.widthAnchor.constraint(greaterThanOrEqualTo: keyItem!.widthAnchor).isActive = true
            }
        }
        if (additionalConstraints != nil) {
            for constraint in additionalConstraints! {
                constraint.isActive = true
            }
        }
        return stackView
    }
}
