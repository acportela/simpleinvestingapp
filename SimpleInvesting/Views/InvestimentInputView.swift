//
//  SingleItemInputView.swift
//  SimpleInvesting
//
//  Created by Antonio Rodrigues on 20/04/19.
//  Copyright © 2019 Antonio Rodrigues. All rights reserved.
//

import UIKit

class InvestimentInputView: UIView, ViewCodingProtocol {
    
    private let titleLabel: UILabel = {
        let title = UILabel()
        title.textAlignment = .center
        title.font = Resources.Fonts.light(ofSize: 14)
        title.textColor = Resources.Colors.grey
        return title
    }()
    
    var inputField: UITextField = {
        let value = UITextField()
        value.textAlignment = .center
        value.font = Resources.Fonts.light(ofSize: 29)
        value.textColor = Resources.Colors.grey
        value.keyboardType = .asciiCapableNumberPad
        return value
    }()
    
    var title: String {
        return "Quanto você gostaria de aplicar? ⃰"
    }
    
    var initialValue: String {
        return "R$ "
    }
    
    private let separator = UIView()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupViewConfiguration()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("Use view coding to initialize view")
    }
 
    func buildViewHierarchy() {
        addSubview(titleLabel)
        addSubview(inputField)
        addSubview(separator)
    }
    
    func setupConstraints() {
        
        titleLabel.snp.makeConstraints { make in
            make.left.top.right.equalToSuperview()
        }
        
        inputField.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(16)
        }
        
        separator.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.left.right.equalToSuperview()
            make.top.equalTo(inputField.snp.bottom).offset(4)
        }
        
    }
    
    func configureViews() {
        backgroundColor = Resources.Colors.white
        separator.backgroundColor = Resources.Colors.lightGrey.withAlphaComponent(0.3)
        setupInput()
    }
    
    func setupInput() {
        
        titleLabel.text = title
        inputField.text = initialValue
        inputField.delegate = self
        inputField.inputAccessoryView = getConfiguredToolBar()
        inputField.addTarget(self, action: #selector(editingBegan), for: .editingDidBegin)
        inputField.addTarget(self, action: #selector(editingEnded), for: .editingDidEnd)
        
    }
    
}

extension InvestimentInputView {
    
    private func getConfiguredToolBar() -> UIToolbar {
        
        let flexibleSpaceItem =
            UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                            target: nil,
                            action: nil)

        let doneItem =
            UIBarButtonItem(barButtonSystemItem: .done,
                            target: self,
                            action: #selector(onDoneAction))
        
        let toolbar = UIToolbar()
        toolbar.items = [flexibleSpaceItem, doneItem]
        toolbar.sizeToFit()
        
        return toolbar
        
    }
    
    @objc
    func onDoneAction() {
        inputField.resignFirstResponder()
    }
    
    @objc
    func editingBegan() {
        inputField.text = ""
    }
    
    @objc func editingEnded() {
        guard let currentText = inputField.text, let value = Double(currentText) else {
            inputField.text = initialValue
            return
        }
        inputField.text = ValueKind.capital(value: value).formatted
    }
    
}

extension InvestimentInputView: UITextFieldDelegate {
    
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        
        guard let currentText = textField.text else {
            return false
        }
        
        if !string.isEmpty && Int(string) == nil { return false }
        
        if currentText.count >= 30 { return false }
        
        return true
        
    }
    
}
