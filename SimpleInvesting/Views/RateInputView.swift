//
//  RateInputView.swift
//  SimpleInvesting
//
//  Created by Antonio Rodrigues on 21/04/19.
//  Copyright © 2019 Antonio Rodrigues. All rights reserved.
//

import UIKit

final class RateInputView: InvestimentInputView {
    
    override var title: String {
        return "Qual o percentual do CDI do investimento? ⃰"
    }
    
    override var initialValue: String {
        return "100%"
    }
    
    override func setupInput() {
        super.setupInput()
        setDefaultCurrentValue()
    }
    
    @objc
    override func editingEnded() {
        guard let currentText = inputField.text, let value = Double(currentText) else {
            inputField.text = initialValue
            setDefaultCurrentValue()
            postEditingEndedAction?()
            return
        }
        currentValue = ValueKind.rate(value: value)
        inputField.text = currentValue?.formatted ?? initialValue
        postEditingEndedAction?()
    }
    
    private func setDefaultCurrentValue() {
        let initial = initialValue.replacingOccurrences(of: "%", with: "")
        if let value = Double(initial) {
            currentValue = ValueKind.rate(value: value)
        }
    }
    
}
