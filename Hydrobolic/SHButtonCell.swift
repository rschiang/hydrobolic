//
//  SHButtonCell.swift
//  Hydrobolic
//
//  Declares a custom ButtonCell to draw Aqua-inspired custom buttons.
//

import Foundation
import AppKit

class SHButtonCell: NSButtonCell {
    private let radius: CGFloat = 10.0

    /// Calculates the physical control bound to draw within the frame.
    private func calculateFrame(forControlView: NSView) -> NSRect {
        let frame = forControlView.frame
        let insets = forControlView.alignmentRectInsets
        return NSRect(x: frame.minX + insets.left + insets.right,
                      y: frame.minY + insets.top + insets.bottom,
                      width: frame.width - insets.left - insets.right,
                      height: frame.height - insets.top - insets.bottom)
    }

    /// Creates a clipping path for the control view.
    private func createPath(forControlView: NSView) -> NSBezierPath {
        return NSBezierPath(roundedRect: calculateFrame(forControlView: forControlView), xRadius: radius, yRadius: radius)
    }

    /// Creates a clipping path that resembles the highlighted gloss area of a button.
    private func createHighlightPathForButton(in rect: NSRect) -> NSBezierPath {
        let path = NSBezierPath()

        let topLeftPoint = NSPoint(x: min(rect.minX + radius + 1, rect.maxX - radius), y: rect.minY)
        path.move(to: topLeftPoint)

        let topRightPoint = NSPoint(x: max(rect.maxX - radius - 1, rect.minX + radius), y: rect.minY)
        path.line(to: topRightPoint)

        let rightCurvePoint = NSPoint(x: rect.maxX - 2, y: rect.minY + radius - 4)
        path.curve(to: rightCurvePoint,
                        controlPoint1: .init(x: topRightPoint.x + radius / 2, y: topRightPoint.y),
                        controlPoint2: .init(x: rightCurvePoint.x, y: rightCurvePoint.y - 2))

        let bottomRightPoint = NSPoint(x: rightCurvePoint.x - 2, y: rightCurvePoint.y + 2)
        path.curve(to: bottomRightPoint,
                        controlPoint1: .init(x: rightCurvePoint.x, y: rightCurvePoint.y + 2),
                        controlPoint2: .init(x: bottomRightPoint.x - 1, y: bottomRightPoint.y))

        let bottomLeftPoint = NSPoint(x: rect.minX + 4, y: bottomRightPoint.y)
        path.line(to: bottomLeftPoint)

        let leftCurvePoint = NSPoint(x: rect.minX + 2, y: rightCurvePoint.y)
        path.curve(to: leftCurvePoint,
                        controlPoint1: .init(x: bottomLeftPoint.x + 1, y: bottomLeftPoint.y),
                        controlPoint2: .init(x: leftCurvePoint.x, y: leftCurvePoint.y + 2))

        path.curve(to: topLeftPoint,
                        controlPoint1: .init(x: leftCurvePoint.x, y: leftCurvePoint.y - 2),
                        controlPoint2: .init(x: topLeftPoint.x - radius / 2, y: topLeftPoint.y))
        path.close()
        return path
    }

    // Override functions

    /// Draws the background (bezel) of the button depending on its style.
    override func drawBezel(withFrame frame: NSRect, in controlView: NSView) {
        let button = controlView as! NSButton

        let rect = calculateFrame(forControlView: controlView)
        let isDark = button.effectiveAppearance.bestMatch(from: [.aqua, .darkAqua]) == .darkAqua
        let accentColor = button.contentTintColor ?? NSColor.controlAccentColor
        let bezelStyle = button.bezelStyle

        let background = NSBezierPath(roundedRect: rect, xRadius: radius, yRadius: radius)
        let backgroundColor = isDark ? SHAppearance.controlBackgroundColorDark : SHAppearance.controlBackgroundColor
        let shadow = SHAppearance.controlShadow
        shadow.apply {
            backgroundColor.setFill()
            background.fill()
        }

        if (isHighlighted) {
            let accentFill = NSGradient(colorsAndLocations:
                                            (accentColor, 0),
                                            (accentColor.withAlphaComponent(0.44), 0.56),
                                            (accentColor.withAlphaComponent(0.25), 1))
            accentFill!.draw(in: background, angle: 90)
        }

        let backgroundFill = (isDark && isHighlighted) ? SHAppearance.controlBackgroundGradientDark :
                                                         SHAppearance.controlBackgroundGradient
        backgroundFill.draw(in: background, angle: 90)

        let innerShadow = isDark ? SHAppearance.controlInnerGlow : SHAppearance.controlInnerShadow
        innerShadow.apply {
            background.setClip()

            let outer = NSBezierPath(outsetRoundedRect: rect, radius: radius, by: 2)
            outer.append(background.reversed)

            let outerFill = SHAppearance.controlBorderColorSolid
            outerFill.setFill()
            outer.fill()
        }

        let border = NSBezierPath(outsetRoundedRect: rect, radius: radius, by: 1)
        border.append(background.reversed)

        let borderStroke = isDark ? SHAppearance.controlBorderColorDark : SHAppearance.controlBorderColor
        if (isHighlighted) {
            let borderFill = NSGradient(starting: accentColor, ending: borderStroke)
            borderFill!.draw(in: border, angle: 90)
        } else {
            borderStroke.setFill()
            border.fill()
        }

        let highlight = createHighlightPathForButton(in: rect)
        let highlightFill = isHighlighted ? SHAppearance.controlHighlightGradientFocused :
                                            isDark ? SHAppearance.controlHighlightGradientDark :
                                                     SHAppearance.controlHighlightGradient
        highlightFill.draw(in: highlight, angle: 90)
    }

    override func hitTest(for event: NSEvent, in cellFrame: NSRect, of controlView: NSView) -> NSCell.HitResult {
        if (event.window == controlView.window) {
            let hitPoint = controlView.convert(event.locationInWindow, from: nil)
            let cellPath = createPath(forControlView: controlView)
            if (cellPath.contains(hitPoint)) {
                return .contentArea
            }
        }
        return []
    }

    override func drawFocusRingMask(withFrame cellFrame: NSRect, in controlView: NSView) {
        let cellPath = createPath(forControlView: controlView)
        cellPath.fill()
    }
}
