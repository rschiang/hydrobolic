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

    private func calculateFrame(forControlView: NSView) -> NSRect {
        let frame = forControlView.frame
        let insets = forControlView.alignmentRectInsets
        return NSRect(x: frame.minX + insets.left + insets.right, y: frame.minY + insets.top + insets.bottom,
                      width: frame.width - insets.left - insets.right,
                      height: frame.height - insets.top - insets.bottom)
    }

    private func createPath(forControlView: NSView) -> NSBezierPath {
        return NSBezierPath(roundedRect: calculateFrame(forControlView: forControlView), xRadius: radius, yRadius: radius)
    }

    override func drawBezel(withFrame frame: NSRect, in controlView: NSView) {
        let rect = calculateFrame(forControlView: controlView)
        let isDark = controlView.effectiveAppearance.bestMatch(from: [.aqua, .darkAqua]) == .darkAqua
        let accentColor = (controlView as! NSButton).contentTintColor ?? NSColor.controlAccentColor

        NSGraphicsContext.saveGraphicsState()

        let shadow = NSShadow()
        shadow.shadowColor = NSColor(white: 0, alpha: 0.3)
        shadow.shadowOffset = CGSize(width: 0, height: -1.5)
        shadow.shadowBlurRadius = 0.75
        shadow.set()

        let background = NSBezierPath(roundedRect: rect, xRadius: radius, yRadius: radius)
        let backgroundColor = isDark ? NSColor(white: 0.22, alpha: 1.0) : NSColor(white: 1.0, alpha: 1.0)
        backgroundColor.setFill()
        background.fill()

        NSGraphicsContext.restoreGraphicsState()

        if (isHighlighted) {
            let accentFill = NSGradient(colorsAndLocations:
                                            (accentColor, 0),
                                        (accentColor.withAlphaComponent(0.44), 0.56),
                                        (accentColor.withAlphaComponent(0.25), 1))
            accentFill!.draw(in: background, angle: 90.0)
        }

        let backgroundFill = NSGradient(colorsAndLocations:
                                            (NSColor(white: 0, alpha: 0.24), 0),
                                            (NSColor(white: 0, alpha: 0.04), 0.77),
                                            (NSColor(white: 0, alpha: 0), 1))
        backgroundFill!.draw(in: background, angle: 90.0)

        let outer = NSBezierPath(roundedRect: rect.insetBy(dx: -2.0, dy: -2.0), xRadius: radius + 2.0, yRadius: radius + 2.0)
        outer.append(background.reversed)

        NSGraphicsContext.saveGraphicsState()
        background.setClip()

        let innerShadow = NSShadow()
        innerShadow.shadowColor = isDark ? NSColor(white: 1, alpha: 0.05) : NSColor(white: 0, alpha: 0.2)
        innerShadow.shadowOffset = CGSize(width: 0, height: -1)
        innerShadow.shadowBlurRadius = 3
        innerShadow.set()

        let outerFill = NSColor(white: 0.44, alpha: 1.0)
        outerFill.setFill()
        outer.fill()
        NSGraphicsContext.restoreGraphicsState()

        let border = NSBezierPath(roundedRect: rect.insetBy(dx: -1.0, dy: -1.0), xRadius: radius + 1, yRadius: radius + 1)
        border.append(background.reversed)

        let borderStroke = NSColor(white: isDark ? 0.22 : 0, alpha: 0.44)
        if (isHighlighted) {
            let borderFill = NSGradient(starting: accentColor, ending: borderStroke)
            borderFill!.draw(in: border, angle: 90.0)
        } else {
            borderStroke.setFill()
            border.fill()
        }

        let highlight = NSBezierPath()

        let topLeftPoint = NSPoint(x: rect.minX + radius + 1, y: rect.minY)
        highlight.move(to: topLeftPoint)

        let topRightPoint = NSPoint(x: rect.maxX - radius - 1, y: rect.minY)
        highlight.line(to: topRightPoint)

        let rightCurvePoint = NSPoint(x: rect.maxX - 2, y: rect.minY + radius - 4)
        highlight.curve(to: rightCurvePoint,
                        controlPoint1: .init(x: topRightPoint.x + radius / 2, y: topRightPoint.y),
                        controlPoint2: .init(x: rightCurvePoint.x, y: rightCurvePoint.y - 2))

        let bottomRightPoint = NSPoint(x: rightCurvePoint.x - 2, y: rightCurvePoint.y + 2)
        highlight.curve(to: bottomRightPoint,
                        controlPoint1: .init(x: rightCurvePoint.x, y: rightCurvePoint.y + 2),
                        controlPoint2: .init(x: bottomRightPoint.x - 1, y: bottomRightPoint.y))

        let bottomLeftPoint = NSPoint(x: rect.minX + 4, y: bottomRightPoint.y)
        highlight.line(to: bottomLeftPoint)

        let leftCurvePoint = NSPoint(x: rect.minX + 2, y: rightCurvePoint.y)
        highlight.curve(to: leftCurvePoint,
                        controlPoint1: .init(x: bottomLeftPoint.x + 1, y: bottomLeftPoint.y),
                        controlPoint2: .init(x: leftCurvePoint.x, y: leftCurvePoint.y + 2))
        highlight.curve(to: topLeftPoint,
                        controlPoint1: .init(x: leftCurvePoint.x, y: leftCurvePoint.y - 2),
                        controlPoint2: .init(x: topLeftPoint.x - radius / 2, y: topLeftPoint.y))
        highlight.close()

        let highlightFill = NSGradient(starting: NSColor(white: 1.0, alpha: isHighlighted ? 0.85 : (isDark ? 0.43 : 0.97)),
                                       ending: NSColor(white: 1.0, alpha: isHighlighted ? 0.33 : (isDark ? 0.18 : 0.5)))
        highlightFill!.draw(in: highlight, angle: 90.0)
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
