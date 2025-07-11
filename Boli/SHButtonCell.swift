//
//  SHButtonCell.swift
//  Boli
//
//  Created by 姜柏任 on 2025/7/11.
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

        NSGraphicsContext.saveGraphicsState()

        let shadow = NSShadow()
        shadow.shadowColor = NSColor(white: 0, alpha: 0.3)
        shadow.shadowOffset = CGSize(width: 0, height: -1.25)
        shadow.shadowBlurRadius = 0.25
        shadow.set()

        let background = NSBezierPath(roundedRect: rect, xRadius: radius, yRadius: radius)
        background.fill()

        NSGraphicsContext.restoreGraphicsState()

        let backgroundFill = isHighlighted ?
                                NSGradient(colorsAndLocations:
                                            (NSColor(red: 0.114, green: 0.612, blue: 0.988, alpha: 1.0), 0),
                                            (NSColor(red: 0.501, green: 0.737, blue: 0.949, alpha: 1.0), 0.42),
                                            (NSColor(red: 0.565, green: 0.788, blue: 0.984, alpha: 1.0), 0.56),
                                            (NSColor(red: 0.631, green: 0.855, blue: 1.0, alpha: 1.0), 0.77),
                                            (NSColor(red: 0.733, green: 0.925, blue: 1.0, alpha: 1.0), 1)) :
                                NSGradient(colorsAndLocations:
                                            (NSColor(white: 0.76, alpha: 1.0), 0),
                                            (NSColor(white: 0.96, alpha: 1.0), 0.77),
                                            (NSColor(white: 1.0, alpha: 1.0), 1))
        backgroundFill!.draw(in: background, angle: 90.0)


        let border = NSBezierPath(roundedRect: rect.insetBy(dx: -1.0, dy: -1.0), xRadius: radius + 1.0, yRadius: radius + 1.0)
        border.append(background.reversed)

        let borderFill = NSGradient(starting: isHighlighted ?
                                    NSColor(red: 0.2, green: 0.231, blue: 0.667, alpha: 1.0) : NSColor(white: 0.55, alpha: 1.0),
                                    ending: NSColor(white: 0.44, alpha: 1.0))
        borderFill!.draw(in: border, angle: 90.0)

        let highlight = NSBezierPath()

        let topLeftPoint = NSPoint(x: rect.minX + radius + 1, y: rect.minY)
        highlight.move(to: topLeftPoint)

        let topRightPoint = NSPoint(x: rect.maxX - radius - 1, y: rect.minY)
        highlight.line(to: topRightPoint)

        let rightCurvePoint = NSPoint(x: rect.maxX - 3, y: rect.minY + radius - 4)
        highlight.curve(to: rightCurvePoint,
                        controlPoint1: .init(x: topRightPoint.x + radius / 2, y: topRightPoint.y),
                        controlPoint2: .init(x: rightCurvePoint.x, y: rightCurvePoint.y - 2))

        let bottomRightPoint = NSPoint(x: rightCurvePoint.x - 2, y: rightCurvePoint.y + 2)
        highlight.curve(to: bottomRightPoint,
                        controlPoint1: .init(x: rightCurvePoint.x, y: rightCurvePoint.y + 1),
                        controlPoint2: .init(x: bottomRightPoint.x - 1, y: bottomRightPoint.y))

        let bottomLeftPoint = NSPoint(x: rect.minX + 5, y: bottomRightPoint.y)
        highlight.line(to: bottomLeftPoint)

        let leftCurvePoint = NSPoint(x: rect.minX + 3, y: rightCurvePoint.y)
        highlight.curve(to: leftCurvePoint,
                        controlPoint1: .init(x: bottomLeftPoint.x + 1, y: bottomLeftPoint.y),
                        controlPoint2: .init(x: leftCurvePoint.x, y: leftCurvePoint.y + 1))
        highlight.curve(to: topLeftPoint,
                        controlPoint1: .init(x: leftCurvePoint.x, y: leftCurvePoint.y - 2),
                        controlPoint2: .init(x: topLeftPoint.x - radius / 2, y: topLeftPoint.y))
        highlight.close()

        let highlightFill = NSGradient(starting: NSColor(white: 1.0, alpha: 0.97),
                                       ending: NSColor(white: 1.0, alpha: 0.5))
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
