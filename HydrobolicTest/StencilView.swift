//
//  StencilView.swift
//  HydrobolicTest
//
//  General test view.
//

import AppKit
import Hydrobolic

class StencilView: NSView {

    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)

        let buttonNormal = SHButton(title: "Button")
        buttonNormal.setMinimumSizeConstraint(width: 82)

        let buttonDefault = NSButton(title: "Default", keyEquivalent: "\r")
        buttonDefault.setMinimumSizeConstraint(width: 82)

        let buttonBeveled = NSButton(bezelStyle: .regularSquare, title: "Bevel")
        buttonBeveled.setMinimumSizeConstraint(width: 82, height: 25)

        let buttonSquare = NSButton(bezelStyle: .shadowlessSquare, title: "Square")
        buttonSquare.setMinimumSizeConstraint(width: 82, height: 25)

        let radioButtons = NSStackView(.vertical, alignment: .leading, spacing: 6, views: [
            NSButton(radioButtonWithTitle: "Radio", state: .on, action: #selector(radioButtonClicked)),
            NSButton(radioButtonWithTitle: "Radio", action: #selector(radioButtonClicked))
        ])

        let checkboxes = NSStackView(.vertical, alignment: .leading, spacing: 6, views: [
            NSButton(checkboxWithTitle: "Switch", state: .on),
            NSButton(checkboxWithTitle: "Switch")
        ])

        let slider = NSSlider(value: 0.5, minValue: 0, maxValue: 1, target: nil, action: nil)
        slider.translatesAutoresizingMaskIntoConstraints = false

        let ticker = NSSlider(value: 0.5, minValue: 0, maxValue: 1, target: nil, action: nil)
        ticker.numberOfTickMarks = 3
        ticker.tickMarkPosition = .below
        ticker.translatesAutoresizingMaskIntoConstraints = false

        let view = NSStackView(.vertical, alignment: .centerX)
        view.setHuggingPriority(.fittingSizeCompression, for: .horizontal)
        view.setHuggingPriority(.fittingSizeCompression, for: .vertical)

        let leftColumn = NSStackView(.vertical, alignment: .leading)
        let rightColumn = NSStackView(.vertical, alignment: .leading, views: {

            let pushButtonRow = NSStackView(.horizontal, alignment: .centerY, views: [buttonNormal, buttonDefault])

            return [
                pushButtonRow,
                NSStackView(.horizontal, alignment: .centerY, views: [buttonBeveled, buttonSquare]),
                NSStackView(.horizontal, alignment: .centerY, distribution: .fillEqually, views: [radioButtons, checkboxes]),
                slider,
                ticker,
            ]
        }())
        let columns = NSStackView(.horizontal, alignment: .top, spacing: 12, views: [leftColumn, rightColumn])
        view.addView(columns, in: .center)

        let textField = NSTextField()
        textField.placeholderString = "Text field"
        textField.translatesAutoresizingMaskIntoConstraints = false
        leftColumn.addArrangedSubview(textField)
        textField.setMinimumSizeConstraint(width: 153)

        let popup = NSPopUpButton()
        popup.addItem(withTitle: "Pop Up Menu")
        popup.translatesAutoresizingMaskIntoConstraints = false
        leftColumn.addArrangedSubview(popup)
        popup.widthAnchor.constraint(greaterThanOrEqualTo: textField.widthAnchor).isActive = true

        let comboBox = NSComboBox()
        comboBox.stringValue = "Combo Box"
        comboBox.translatesAutoresizingMaskIntoConstraints = false
        leftColumn.addArrangedSubview(comboBox)
        comboBox.widthAnchor.constraint(greaterThanOrEqualTo: textField.widthAnchor).isActive = true

        let datePicker = NSDatePicker()
        datePicker.datePickerElements = .yearMonthDay
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        leftColumn.addArrangedSubview(datePicker)

        let buttonTextured = NSButton(bezelStyle: .texturedSquare, title: "Button")
        buttonTextured.sizeToFit()
        leftColumn.addArrangedSubview(buttonTextured)

        let buttonHelp = NSButton(bezelStyle: .helpButton)
        buttonHelp.sizeToFit()
        leftColumn.addSubview(buttonHelp)
        buttonHelp.leadingAnchor.constraint(equalToSystemSpacingAfter: buttonTextured.trailingAnchor, multiplier: 1).isActive = true
        buttonHelp.centerYAnchor.constraint(equalTo: buttonTextured.centerYAnchor).isActive = true

        let buttonCircular = NSButton(bezelStyle: .circular)
        leftColumn.addSubview(buttonCircular)
        buttonCircular.leadingAnchor.constraint(equalTo: datePicker.trailingAnchor, constant: 16).isActive = true
        buttonCircular.centerYAnchor.constraint(equalTo: datePicker.bottomAnchor).isActive = true
        buttonCircular.setMinimumSizeConstraint(width: 26, height: 26)

        let progressIndeterminate = NSProgressIndicator()
        progressIndeterminate.observedProgress = .init()
        progressIndeterminate.translatesAutoresizingMaskIntoConstraints = false

        leftColumn.addArrangedSubview(progressIndeterminate)
        progressIndeterminate.widthAnchor.constraint(greaterThanOrEqualTo: textField.widthAnchor).isActive = true
        progressIndeterminate.setMinimumSizeConstraint(height: 16)

        let progressIndicator = NSProgressIndicator()
        progressIndicator.observedProgress = .init(totalUnitCount: 100)
        progressIndicator.observedProgress?.completedUnitCount = 60
        progressIndicator.translatesAutoresizingMaskIntoConstraints = false

        view.addArrangedSubview(progressIndicator)
        progressIndicator.leadingAnchor.constraint(equalTo: leftColumn.leadingAnchor).isActive = true
        progressIndicator.trailingAnchor.constraint(equalTo: rightColumn.trailingAnchor).isActive = true
        progressIndicator.setMinimumSizeConstraint(height: 16)

        let tabView = NSTabView()
        tabView.translatesAutoresizingMaskIntoConstraints = false
        self.subviews.append(tabView)
        tabView.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor).isActive = true
        tabView.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor).isActive = true
        tabView.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor).isActive = true
        tabView.bottomAnchor.constraint(equalTo: self.layoutMarginsGuide.bottomAnchor).isActive = true

        let tab1 = NSTabViewItem()
        tab1.label = "Tab"
        tab1.view = view
        tabView.addTabViewItem(tab1)

        let tab2 = NSTabViewItem()
        tab2.label = "View"
        tab2.view = view
        tabView.addTabViewItem(tab2)

        view.widthAnchor.constraint(equalToConstant: view.fittingSize.width + 30).isActive = true
        view.heightAnchor.constraint(equalToConstant: view.fittingSize.height + 12).isActive = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) not implemented")
    }

    @objc
    func radioButtonClicked(_ sender: Any?) {
    }
}

#if DEBUG
import SwiftUI
struct StencilViewWrapper: View, NSViewRepresentable {
    typealias NSViewType = StencilView

    func makeNSView(context: Context) -> StencilView {
        return StencilView()
    }

    func updateNSView(_ nsView: StencilView, context: Context) {
    }

    func sizeThatFits(_ proposal: ProposedViewSize, nsView: StencilView, context: Context) -> CGSize? {
        return nsView.fittingSize
    }
}

#Preview {
    StencilViewWrapper()
}
#endif
