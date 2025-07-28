//
//  StencilView.swift
//  HydrobolicTest
//
//  General test view.
//

import AppKit
import SwiftUI
import Hydrobolic

class SHStencilView: NSView {

    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)

        let view = NSStackView()
        view.orientation = .vertical
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setHuggingPriority(.fittingSizeCompression, for: .horizontal)
        view.setHuggingPriority(.fittingSizeCompression, for: .vertical)

        let columns = NSStackView()
        columns.orientation = .horizontal
        columns.alignment = .top
        columns.spacing = 12
        columns.translatesAutoresizingMaskIntoConstraints = false
        view.addView(columns, in: .center)

        let leftColumn = NSStackView()
        leftColumn.orientation = .vertical
        leftColumn.alignment = .leading
        leftColumn.translatesAutoresizingMaskIntoConstraints = false
        columns.addArrangedSubview(leftColumn)

        let rightColumn = NSStackView()
        rightColumn.orientation = .vertical
        rightColumn.alignment = .leading
        rightColumn.translatesAutoresizingMaskIntoConstraints = false
        columns.addArrangedSubview(rightColumn)

        let textField = NSTextField()
        textField.placeholderString = "Text field"
        textField.translatesAutoresizingMaskIntoConstraints = false
        leftColumn.addArrangedSubview(textField)
        textField.widthAnchor.constraint(greaterThanOrEqualToConstant: 153).isActive = true

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

        let buttonTextured = NSButton()
        buttonTextured.title = "Button"
        buttonTextured.bezelStyle = .texturedSquare
        buttonTextured.translatesAutoresizingMaskIntoConstraints = false
        buttonTextured.sizeToFit()
        leftColumn.addArrangedSubview(buttonTextured)

        let buttonHelp = NSButton()
        buttonHelp.title = ""
        buttonHelp.bezelStyle = .helpButton
        buttonHelp.translatesAutoresizingMaskIntoConstraints = false
        buttonHelp.sizeToFit()
        view.addSubview(buttonHelp)
        buttonHelp.leadingAnchor.constraint(equalToSystemSpacingAfter: buttonTextured.trailingAnchor, multiplier: 1).isActive = true
        buttonHelp.centerYAnchor.constraint(equalTo: buttonTextured.centerYAnchor).isActive = true

        let buttonCircular = NSButton()
        buttonCircular.title = ""
        buttonCircular.bezelStyle = .circular
        buttonCircular.isHighlighted = true
        buttonCircular.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(buttonCircular)
        buttonCircular.leadingAnchor.constraint(equalTo: datePicker.trailingAnchor, constant: 16).isActive = true
        buttonCircular.centerYAnchor.constraint(equalTo: datePicker.bottomAnchor).isActive = true
        buttonCircular.widthAnchor.constraint(greaterThanOrEqualToConstant: 26).isActive = true
        buttonCircular.heightAnchor.constraint(greaterThanOrEqualToConstant: 26).isActive = true

        let progressIndeterminate = NSProgressIndicator()
        progressIndeterminate.observedProgress = .init()
        progressIndeterminate.translatesAutoresizingMaskIntoConstraints = false

        leftColumn.addArrangedSubview(progressIndeterminate)
        progressIndeterminate.widthAnchor.constraint(greaterThanOrEqualTo: textField.widthAnchor).isActive = true
        progressIndeterminate.heightAnchor.constraint(greaterThanOrEqualToConstant: 16).isActive = true

        let pushButtonRow = NSStackView()
        pushButtonRow.orientation = .horizontal
        rightColumn.addArrangedSubview(pushButtonRow)

        let buttonNormal = NSButton()
        buttonNormal.title = "Button"
        buttonNormal.translatesAutoresizingMaskIntoConstraints = false
        pushButtonRow.addArrangedSubview(buttonNormal)
        buttonNormal.widthAnchor.constraint(greaterThanOrEqualToConstant: 82).isActive = true

        let buttonDefault = NSButton()
        buttonDefault.title = "Default"
        buttonDefault.keyEquivalent = "\r"
        buttonDefault.translatesAutoresizingMaskIntoConstraints = false
        pushButtonRow.addArrangedSubview(buttonDefault)
        buttonDefault.widthAnchor.constraint(greaterThanOrEqualToConstant: 82).isActive = true

        let beveledButtonRow = NSStackView()
        beveledButtonRow.orientation = .horizontal
        rightColumn.addArrangedSubview(beveledButtonRow)

        let buttonBeveled = NSButton()
        buttonBeveled.title = "Bevel"
        buttonBeveled.bezelStyle = .regularSquare
        buttonBeveled.translatesAutoresizingMaskIntoConstraints = false
        beveledButtonRow.addArrangedSubview(buttonBeveled)
        buttonBeveled.widthAnchor.constraint(greaterThanOrEqualToConstant: 82).isActive = true
        buttonBeveled.heightAnchor.constraint(greaterThanOrEqualToConstant: 25).isActive = true

        let buttonSquare = NSButton()
        buttonSquare.title = "Square"
        buttonSquare.bezelStyle = .shadowlessSquare
        buttonSquare.translatesAutoresizingMaskIntoConstraints = false
        beveledButtonRow.addArrangedSubview(buttonSquare)
        buttonSquare.widthAnchor.constraint(greaterThanOrEqualToConstant: 82).isActive = true
        buttonSquare.heightAnchor.constraint(greaterThanOrEqualToConstant: 25).isActive = true

        let radioButtonRow = NSStackView()
        radioButtonRow.orientation = .horizontal
        radioButtonRow.distribution = .fillEqually
        rightColumn.addArrangedSubview(radioButtonRow)
        radioButtonRow.widthAnchor.constraint(greaterThanOrEqualTo: pushButtonRow.widthAnchor).isActive = true

        let radioButtons = NSStackView()
        radioButtons.orientation = .vertical
        radioButtons.alignment = .leading
        radioButtons.spacing = 6
        radioButtonRow.addArrangedSubview(radioButtons)

        let radio1 = NSButton(radioButtonWithTitle: "Radio", target: nil, action: nil)
        radio1.state = .on
        radio1.translatesAutoresizingMaskIntoConstraints = false
        radioButtons.addArrangedSubview(radio1)

        let radio2 = NSButton(radioButtonWithTitle: "Radio", target: nil, action: nil)
        radio2.translatesAutoresizingMaskIntoConstraints = false
        radioButtons.addArrangedSubview(radio2)

        let checkboxes = NSStackView()
        checkboxes.orientation = .vertical
        checkboxes.alignment = .leading
        checkboxes.spacing = 6
        radioButtonRow.addArrangedSubview(checkboxes)

        let checkbox1 = NSButton(checkboxWithTitle: "Switch", target: nil, action: nil)
        checkbox1.state = .on
        checkbox1.translatesAutoresizingMaskIntoConstraints = false
        checkboxes.addArrangedSubview(checkbox1)

        let checkbox2 = NSButton(checkboxWithTitle: "Switch", target: nil, action: nil)
        checkbox2.translatesAutoresizingMaskIntoConstraints = false
        checkboxes.addArrangedSubview(checkbox2)

        let slider = NSSlider(value: 0.5, minValue: 0, maxValue: 1, target: nil, action: nil)
        slider.translatesAutoresizingMaskIntoConstraints = false
        rightColumn.addArrangedSubview(slider)

        let ticker = NSSlider(value: 0.5, minValue: 0, maxValue: 1, target: nil, action: nil)
        ticker.numberOfTickMarks = 3
        ticker.tickMarkPosition = .below
        ticker.translatesAutoresizingMaskIntoConstraints = false
        rightColumn.addArrangedSubview(ticker)

        let progressIndicator = NSProgressIndicator()
        progressIndicator.observedProgress = .init(totalUnitCount: 100)
        progressIndicator.observedProgress?.completedUnitCount = 60
        progressIndicator.translatesAutoresizingMaskIntoConstraints = false

        view.addArrangedSubview(progressIndicator)
        progressIndicator.leadingAnchor.constraint(equalTo: leftColumn.leadingAnchor).isActive = true
        progressIndicator.trailingAnchor.constraint(equalTo: rightColumn.trailingAnchor).isActive = true
        progressIndicator.heightAnchor.constraint(greaterThanOrEqualToConstant: 16).isActive = true

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
}

struct StencilView: View, NSViewRepresentable {
    typealias NSViewType = SHStencilView

    func makeNSView(context: Context) -> SHStencilView {
        return SHStencilView()
    }

    func updateNSView(_ nsView: SHStencilView, context: Context) {
    }

    func sizeThatFits(_ proposal: ProposedViewSize, nsView: SHStencilView, context: Context) -> CGSize? {
        return nsView.fittingSize
    }
}

#Preview {
    StencilView()
}
