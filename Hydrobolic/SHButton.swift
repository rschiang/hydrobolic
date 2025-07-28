//
//  SHButton.swift
//  Hydrobolic
//
//  This file subclasses NSButton in order to use our own subclassed ButtonCell.
//

import AppKit

public class SHButton : NSButton {

    public override class var cellClass: AnyClass? {
        get { SHButtonCell.self }
        set {}
    }

    override public func minimumSize(withPrioritizedCompressionOptions prioritizedOptions: [NSUserInterfaceCompressionOptions]) -> NSSize {
        let preferred = super.minimumSize(withPrioritizedCompressionOptions: prioritizedOptions)
        return .init(width: min(preferred.width, 20), height: min(preferred.height, 20))
    }
}
