//
//  NSShadow+Extension.swift
//  Hydrobolic
//
//  Convenience functions for NSShadow operations.
//

import AppKit

extension NSShadow {
    convenience init(color: NSColor, offset: NSSize, blurRadius: CGFloat) {
        self.init()
        self.shadowColor = color
        self.shadowOffset = offset
        self.shadowBlurRadius = blurRadius
    }

    func apply(task: () -> Void) {
        NSGraphicsContext.saveGraphicsState()
        self.set()
        task()
        NSGraphicsContext.restoreGraphicsState()
    }
}
