//
//  StencilView.swift
//  HydrobolicTest
//
//  General test view.
//

import AppKit
import SwiftUI

class SHStencilView: NSView {

    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)

        let view = NSView()

        let textField = NSTextField()
        textField.placeholderString = "Text field"
        textField.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(textField)
        textField.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor).isActive = true
        textField.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor).isActive = true
        textField.widthAnchor.constraint(greaterThanOrEqualToConstant: 153).isActive = true

        let popup = NSPopUpButton()
        popup.addItem(withTitle: "Pop Up Menu")
        popup.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(popup)
        popup.leadingAnchor.constraint(equalTo: textField.leadingAnchor).isActive = true
        popup.trailingAnchor.constraint(equalTo: textField.trailingAnchor).isActive = true
        popup.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 10).isActive = true

        let comboBox = NSComboBox()
        comboBox.stringValue = "Combo Box"
        comboBox.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(comboBox)
        comboBox.leadingAnchor.constraint(equalTo: textField.leadingAnchor).isActive = true
        comboBox.trailingAnchor.constraint(equalTo: textField.trailingAnchor).isActive = true
        comboBox.topAnchor.constraint(equalTo: popup.bottomAnchor, constant: 10).isActive = true

        let stepper = NSDatePicker()
        stepper.datePickerElements = .yearMonthDay
        stepper.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(stepper)
        stepper.leadingAnchor.constraint(equalTo: textField.leadingAnchor).isActive = true
        stepper.topAnchor.constraint(equalTo: comboBox.bottomAnchor, constant: 10).isActive = true

        let buttonTextured = NSButton()
        buttonTextured.title = "Button"
        buttonTextured.bezelStyle = .texturedSquare
        buttonTextured.translatesAutoresizingMaskIntoConstraints = false
        buttonTextured.sizeToFit()

        view.addSubview(buttonTextured)
        buttonTextured.leadingAnchor.constraint(equalTo: textField.leadingAnchor).isActive = true
        buttonTextured.topAnchor.constraint(equalTo: stepper.bottomAnchor, constant: 10).isActive = true

        let buttonHelp = NSButton()
        buttonHelp.title = ""
        buttonHelp.bezelStyle = .helpButton
        buttonHelp.translatesAutoresizingMaskIntoConstraints = false
        buttonHelp.sizeToFit()

        view.addSubview(buttonHelp)
        buttonHelp.leadingAnchor.constraint(equalToSystemSpacingAfter: buttonTextured.trailingAnchor, multiplier: 1).isActive = true
        buttonHelp.topAnchor.constraint(equalTo: buttonTextured.topAnchor).isActive = true

        let buttonCircular = NSButton()
        buttonCircular.title = ""
        buttonCircular.bezelStyle = .circular
        buttonCircular.isHighlighted = true
        buttonCircular.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(buttonCircular)
        buttonCircular.leadingAnchor.constraint(equalTo: stepper.trailingAnchor, constant: 16).isActive = true
        buttonCircular.centerYAnchor.constraint(equalTo: stepper.bottomAnchor).isActive = true
        buttonCircular.widthAnchor.constraint(greaterThanOrEqualToConstant: 26).isActive = true
        buttonCircular.heightAnchor.constraint(greaterThanOrEqualToConstant: 26).isActive = true

        let progressIndeterminate = NSProgressIndicator()
        progressIndeterminate.observedProgress = .init()
        progressIndeterminate.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(progressIndeterminate)
        progressIndeterminate.leadingAnchor.constraint(equalTo: textField.leadingAnchor).isActive = true
        progressIndeterminate.trailingAnchor.constraint(equalTo: textField.trailingAnchor).isActive = true
        progressIndeterminate.topAnchor.constraint(equalTo: buttonTextured.bottomAnchor, constant: 10).isActive = true
        progressIndeterminate.heightAnchor.constraint(greaterThanOrEqualToConstant: 16).isActive = true

        let buttonNormal = NSButton()
        buttonNormal.title = "Button"
        buttonNormal.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(buttonNormal)
        buttonNormal.leadingAnchor.constraint(equalTo: textField.trailingAnchor, constant: 14).isActive = true
        buttonNormal.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor).isActive = true
        buttonNormal.widthAnchor.constraint(greaterThanOrEqualToConstant: 82).isActive = true

        let buttonDefault = NSButton()
        buttonDefault.title = "Default"
        buttonDefault.keyEquivalent = "\r"
        buttonDefault.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(buttonDefault)
        buttonDefault.leadingAnchor.constraint(equalTo: buttonNormal.trailingAnchor, constant: 14).isActive = true
        buttonDefault.topAnchor.constraint(equalTo: buttonNormal.topAnchor).isActive = true
        buttonDefault.widthAnchor.constraint(greaterThanOrEqualToConstant: 82).isActive = true

        let buttonBeveled = NSButton()
        buttonBeveled.title = "Bevel"
        buttonBeveled.bezelStyle = .regularSquare
        buttonBeveled.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(buttonBeveled)
        buttonBeveled.leadingAnchor.constraint(equalTo: buttonNormal.leadingAnchor).isActive = true
        buttonBeveled.topAnchor.constraint(equalTo: buttonNormal.bottomAnchor, constant: 10).isActive = true
        buttonBeveled.widthAnchor.constraint(greaterThanOrEqualToConstant: 82).isActive = true
        buttonBeveled.heightAnchor.constraint(greaterThanOrEqualToConstant: 25).isActive = true

        let buttonSquare = NSButton()
        buttonSquare.title = "Square"
        buttonSquare.bezelStyle = .shadowlessSquare
        buttonSquare.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(buttonSquare)
        buttonSquare.leadingAnchor.constraint(equalTo: buttonDefault.leadingAnchor).isActive = true
        buttonSquare.topAnchor.constraint(equalTo: buttonBeveled.topAnchor).isActive = true
        buttonSquare.widthAnchor.constraint(greaterThanOrEqualToConstant: 82).isActive = true
        buttonSquare.heightAnchor.constraint(greaterThanOrEqualToConstant: 25).isActive = true

        let radio1 = NSButton(radioButtonWithTitle: "Radio", target: nil, action: nil)
        radio1.state = .on
        radio1.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(radio1)
        radio1.leadingAnchor.constraint(equalTo: buttonNormal.leadingAnchor).isActive = true
        radio1.topAnchor.constraint(equalTo: buttonBeveled.bottomAnchor, constant: 10).isActive = true

        let checkbox1 = NSButton(checkboxWithTitle: "Switch", target: nil, action: nil)
        checkbox1.state = .on
        checkbox1.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(checkbox1)
        checkbox1.leadingAnchor.constraint(equalTo: buttonDefault.leadingAnchor).isActive = true
        checkbox1.firstBaselineAnchor.constraint(equalTo: radio1.firstBaselineAnchor).isActive = true

        let radio2 = NSButton(radioButtonWithTitle: "Radio", target: nil, action: nil)
        radio2.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(radio2)
        radio2.leadingAnchor.constraint(equalTo: radio1.leadingAnchor).isActive = true
        radio2.topAnchor.constraint(equalToSystemSpacingBelow: radio1.bottomAnchor, multiplier: 1).isActive = true

        let checkbox2 = NSButton(checkboxWithTitle: "Switch", target: nil, action: nil)
        checkbox2.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(checkbox2)
        checkbox2.leadingAnchor.constraint(equalTo: checkbox1.leadingAnchor).isActive = true
        checkbox2.firstBaselineAnchor.constraint(equalTo: radio2.firstBaselineAnchor).isActive = true

        let slider = NSSlider(value: 0.5, minValue: 0, maxValue: 1, target: nil, action: nil)
        slider.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(slider)
        slider.leadingAnchor.constraint(equalTo: buttonNormal.leadingAnchor).isActive = true
        slider.trailingAnchor.constraint(equalTo: buttonDefault.trailingAnchor).isActive = true
        slider.topAnchor.constraint(equalTo: radio2.bottomAnchor, constant: 10).isActive = true

        let ticker = NSSlider(value: 0.5, minValue: 0, maxValue: 1, target: nil, action: nil)
        ticker.numberOfTickMarks = 3
        ticker.tickMarkPosition = .below
        ticker.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(ticker)
        ticker.leadingAnchor.constraint(equalTo: buttonNormal.leadingAnchor).isActive = true
        ticker.trailingAnchor.constraint(equalTo: buttonDefault.trailingAnchor).isActive = true
        ticker.topAnchor.constraint(equalTo: slider.bottomAnchor, constant: 10).isActive = true

        let progressIndicator = NSProgressIndicator()
        progressIndicator.observedProgress = .init(totalUnitCount: 100)
        progressIndicator.observedProgress?.completedUnitCount = 60
        progressIndicator.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(progressIndicator)
        progressIndicator.leadingAnchor.constraint(equalTo: textField.leadingAnchor).isActive = true
        progressIndicator.trailingAnchor.constraint(equalTo: buttonDefault.trailingAnchor).isActive = true
        progressIndicator.topAnchor.constraint(equalTo: progressIndeterminate.bottomAnchor, constant: 10).isActive = true
        progressIndicator.heightAnchor.constraint(greaterThanOrEqualToConstant: 16).isActive = true

        let tabView = NSTabView()

        let tab1 = NSTabViewItem()
        tab1.label = "Tab"
        tab1.view = view

        let tab2 = NSTabViewItem()
        tab2.label = "View"
        tab2.view = view

        tabView.addTabViewItem(tab1)
        tabView.addTabViewItem(tab2)
        tabView.translatesAutoresizingMaskIntoConstraints = false

        self.subviews.append(tabView)
        tabView.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor).isActive = true
        tabView.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor).isActive = true
        tabView.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor).isActive = true
        tabView.bottomAnchor.constraint(equalTo: self.layoutMarginsGuide.bottomAnchor).isActive = true
        tabView.widthAnchor.constraint(lessThanOrEqualToConstant: 420).isActive = true
        tabView.heightAnchor.constraint(lessThanOrEqualToConstant: 280).isActive = true
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
}

#Preview {
    StencilView()
}
