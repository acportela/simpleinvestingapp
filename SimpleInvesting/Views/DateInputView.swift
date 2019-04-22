//
//  DateInputView.swift
//  SimpleInvesting
//
//  Created by Antonio Rodrigues on 21/04/19.
//  Copyright © 2019 Antonio Rodrigues. All rights reserved.
//

import UIKit

final class DateInputView: InvestimentInputView {
    
    override var title: String {
        return "Qual a data de vencimento do investimento? ⃰"
    }
    
    override var initialValue: String {
        return "dia/mês/ano"
    }
    
    private var selectedDate: Date? {
        didSet {
            guard let date = selectedDate else {
                currentValue = nil
                return
            }
            inputField.text = getDisplayDate(date)
            currentValue = ValueKind.date(value: date)
        }
    }
    
    private let datePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.locale = .current
        picker.minimumDate = Calendar.current.date(byAdding: .day, value: 1, to: Date())
        picker.datePickerMode = .date
        return picker
    }()
    
    private func getDisplayDate(_ date: Date) -> String {
        
        let calendar = Calendar.current
        
        let dayComponent = calendar.component(.day, from: date)
        let monthComponent = calendar.component(.month, from: date)
        let yearComponent = calendar.component(.year, from: date)
        
        return "\(dayComponent)/\(monthComponent)/\(yearComponent)"
        
    }
    
    override func configureViews() {
        super.configureViews()
        inputField.tintColor = .clear
    }
    
    override func setupInput() {
        super.setupInput()
        inputField.inputView = datePicker
    }
    
    override func onDoneAction() {
        selectedDate = datePicker.date
        super.onDoneAction()
    }
    
    @objc
    override func editingBegan() { }
    
    @objc
    override func editingEnded() { postEditingEndedAction?() }
    
}
