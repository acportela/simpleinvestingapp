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
    
    @objc
    override func editingEnded() {
        guard let currentText = inputField.text, let value = Double(currentText) else {
            inputField.text = initialValue
            return
        }
        inputField.text = ValueKind.rate(value: value).formatted
    }
    
}
