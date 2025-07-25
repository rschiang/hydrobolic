//
//  Extensions.swift
//  Hydrobolic
//
//  Convenience functions for various drawing operations.
//

import AppKit

extension NSShadow {
    /// Creates a shadow object with the specified color, offset, and blur radius.
    convenience init(color: NSColor, offset: NSSize, blurRadius: CGFloat) {
        self.init()
        self.shadowColor = color
        self.shadowOffset = offset
        self.shadowBlurRadius = blurRadius
    }

    /// Apply the shadow to a set of drawing instructions.
    /// - Parameter task: A set of drawing instructions to be applied with the shadow.
    func apply(task: () -> Void) {
        NSGraphicsContext.saveGraphicsState()
        self.set()
        task()
        NSGraphicsContext.restoreGraphicsState()
    }
}

extension NSBezierPath {
    /// Creates and returns a new Bézier path object initialized with a rounded rectangular path, outset by a specific unit.
    /// - Parameters:
    ///   - outsetRoundedRect: The rectangle that defines the basic shape of the path.
    ///   - radius: The radius of each corner oval along all axes.
    ///   - by: The unit length for growing the source rectangle.
    convenience init(outsetRoundedRect: NSRect, radius: CGFloat, by: CGFloat) {
        self.init(roundedRect: outsetRoundedRect.insetBy(dx: -by, dy: -by),
                  xRadius: radius + by, yRadius: radius + by)
    }
}
