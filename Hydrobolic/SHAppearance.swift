//
//  SHAppearance.swift
//  Hydrobolic
//
//  Static class to hold gradients and colors shared by all Aqua-inspired controls.
//

import AppKit

struct SHAppearance {

    // Colors

    static let controlBackgroundColor: NSColor = .white
    static let controlBackgroundColorDark: NSColor = .init(calibratedWhite: 0.22, alpha: 1)
    static let controlBorderColor: NSColor = .init(calibratedWhite: 0, alpha: 0.44)
    static let controlBorderColorDark: NSColor = .init(calibratedWhite: 0, alpha: 0.22)

    // Gradients

    static let controlBackgroundGradient: NSGradient = .init(colorsAndLocations:
                                                                (.black.withAlphaComponent(0.24), 0),
                                                                (.black.withAlphaComponent(0.04), 0.77),
                                                                (.black.withAlphaComponent(0), 1))!

    static let controlBackgroundGradientDark: NSGradient = .init(colorsAndLocations:
                                                                (.white.withAlphaComponent(0.24), 0),
                                                                (.white.withAlphaComponent(0.04), 0.77),
                                                                (.white.withAlphaComponent(0), 1))!

    static let controlHighlightGradient: NSGradient = .init(starting: .white.withAlphaComponent(0.97),
                                                            ending: .white.withAlphaComponent(0.5))!

    static let controlHighlightGradientDark: NSGradient = .init(starting: .white.withAlphaComponent(0.38),
                                                                ending: .white.withAlphaComponent(0.2))!

    static let controlHighlightGradientFocused: NSGradient = .init(starting: .white.withAlphaComponent(0.85),
                                                                   ending: .white.withAlphaComponent(0.33))!

    // Shadows

    static let controlShadow: NSShadow = .init(color: .black.withAlphaComponent(0.3),
                                               offset: .init(width: 0, height: -1.5),
                                               blurRadius: 0.75)

    static let controlInnerShadow: NSShadow = .init(color: .black.withAlphaComponent(0.2),
                                                    offset: .init(width: 0, height: -1),
                                                    blurRadius: 3)

    static let controlInnerGlow: NSShadow = .init(color: .black.withAlphaComponent(0.05),
                                                  offset: .init(width: 0, height: -1),
                                                  blurRadius: 3)
}
