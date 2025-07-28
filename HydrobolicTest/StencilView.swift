//
//  StencilView.swift
//  HydrobolicTest
//
//  General test view.
//

import AppKit
import Hydrobolic

class StencilView: NSView {

    var initialFirstResponder: NSResponder?

    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)

        let textField = NSTextField()
        textField.placeholderString = "Text field"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.setMinimumSizeConstraint(width: 153)

        let popupButton = NSPopUpButton()
        popupButton.addItem(withTitle: "Pop Up Menu")
        popupButton.translatesAutoresizingMaskIntoConstraints = false

        let comboBox = NSComboBox()
        comboBox.stringValue = "Combo Box"
        comboBox.translatesAutoresizingMaskIntoConstraints = false

        let datePicker = NSDatePicker()
        datePicker.datePickerElements = .yearMonthDay
        datePicker.translatesAutoresizingMaskIntoConstraints = false

        let texturedButton = NSButton(bezelStyle: .texturedSquare, title: "Button")
        texturedButton.sizeToFit()

        let helpButton = NSButton(bezelStyle: .helpButton)
        helpButton.sizeToFit()

        let circularButton = NSButton(bezelStyle: .circular)
        circularButton.setMinimumSizeConstraint(width: 26, height: 26)

        let indeterminateProgressBar = NSProgressIndicator()
        indeterminateProgressBar.observedProgress = .init()
        indeterminateProgressBar.translatesAutoresizingMaskIntoConstraints = false
        indeterminateProgressBar.setMinimumSizeConstraint(height: 16)

        let normalButton = NSButton(title: "Button")
        normalButton.setMinimumSizeConstraint(width: 82)

        let defaultButton = NSButton(title: "Default", keyEquivalent: "\r")
        defaultButton.setMinimumSizeConstraint(width: 82)

        let bevelButton = NSButton(bezelStyle: .regularSquare, title: "Bevel")
        bevelButton.setMinimumSizeConstraint(width: 82, height: 25)

        let squareButton = NSButton(bezelStyle: .shadowlessSquare, title: "Square")
        squareButton.setMinimumSizeConstraint(width: 82, height: 25)

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

        let progressBar = NSProgressIndicator()
        progressBar.observedProgress = .init(totalUnitCount: 100)
        progressBar.observedProgress?.completedUnitCount = 60
        progressBar.translatesAutoresizingMaskIntoConstraints = false
        progressBar.setMinimumSizeConstraint(height: 16)

        let controls = StackViewBuilder(.vertical)
            .addKeySubview(
                NSStackView(.horizontal, alignment: .top, spacing: 16, views: [
                    StackViewBuilder(.vertical, alignment: .leading)
                        .addKeySubview(textField)
                        .addAlignedSubview(popupButton)
                        .addAlignedSubview(comboBox)
                        .addArrangedSubview(datePicker)
                        .addUnmanagedSubview(helpButton)
                        .addUnmanagedSubview(circularButton)
                        .addArrangedSubview(texturedButton)
                        .addAlignedSubview(indeterminateProgressBar)
                        .build(additionalConstraints: [
                            helpButton.leadingAnchor.constraint(equalToSystemSpacingAfter: texturedButton.trailingAnchor, multiplier: 1),
                            helpButton.centerYAnchor.constraint(equalTo: texturedButton.centerYAnchor),
                            circularButton.leadingAnchor.constraint(equalToSystemSpacingAfter: datePicker.trailingAnchor, multiplier: 1.5),
                            circularButton.centerYAnchor.constraint(equalTo: datePicker.bottomAnchor),
                        ]),
                    StackViewBuilder(.vertical)
                        .addKeySubview(NSStackView(.horizontal, alignment: .centerY, views: [normalButton, defaultButton]))
                        .addAlignedSubview(NSStackView(.horizontal, alignment: .centerY, views: [bevelButton, squareButton]))
                        .addAlignedSubview(NSStackView(.horizontal, alignment: .centerY, distribution: .fillEqually, views: [radioButtons, checkboxes]))
                        .addAlignedSubview(slider)
                        .addAlignedSubview(ticker)
                        .build()
                ])
            )
            .addAlignedSubview(progressBar)
            .build()
        controls.setHuggingPriority(.fittingSizeCompression, for: .horizontal)
        controls.setHuggingPriority(.fittingSizeCompression, for: .vertical)

        let view = NSView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(controls)
        view.leadingAnchor.constraint(equalTo: controls.leadingAnchor, constant: -15).isActive = true
        view.bottomAnchor.constraint(equalTo: controls.bottomAnchor, constant: 12).isActive = true
        view.widthAnchor.constraint(equalToConstant: controls.fittingSize.width + 30).isActive = true
        view.heightAnchor.constraint(equalToConstant: controls.fittingSize.height + 21).isActive = true

        let tabView = NSTabView()
        tabView.translatesAutoresizingMaskIntoConstraints = false
        self.subviews.append(tabView)
        tabView.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor).isActive = true
        tabView.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor).isActive = true
        tabView.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor).isActive = true
        tabView.bottomAnchor.constraint(equalTo: self.layoutMarginsGuide.bottomAnchor).isActive = true

        tabView.addTabViewItem("Tab", view: view)
        tabView.addTabViewItem("View", view: view)
        self.initialFirstResponder = circularButton
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
