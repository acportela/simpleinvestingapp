//
//  SimulationInputView.swift
//  SimpleInvesting
//
//  Created by Antonio Rodrigues on 20/04/19.
//  Copyright © 2019 Antonio Rodrigues. All rights reserved.
//

import UIKit

final class SimulationInputView: UIView {
    
    private let investimentInput: InvestimentInputView
    private let maturityDateInput: DateItemInputView
    private let rateInput: RateInputView
    
    let button = MainButtonView()
    
    private let contentInputView = UIView()
    
    var simulationTapHandler: ((SimulationInput) -> Void)?
    
    override init(frame: CGRect = .zero) {
        
        investimentInput = InvestimentInputView()
        maturityDateInput = DateItemInputView()
        rateInput = RateInputView()
        
        super.init(frame: frame)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
        
        setupViewConfiguration()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("Use view coding to initialize view")
    }
    
}

extension SimulationInputView: ViewCodingProtocol {
    
    func buildViewHierarchy() {
        addSubview(contentInputView)
        contentInputView.addSubview(investimentInput)
        contentInputView.addSubview(maturityDateInput)
        contentInputView.addSubview(rateInput)
        contentInputView.addSubview(button)
    }
    
    func setupConstraints() {
        
        contentInputView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.topMargin).offset(16)
            make.left.equalTo(safeAreaLayoutGuide.snp.leftMargin).offset(16)
            make.right.equalTo(safeAreaLayoutGuide.snp.rightMargin).inset(16)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottomMargin).inset(16)
        }
        
        investimentInput.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalToSuperview().offset(48)
            make.height.equalTo(64)
        }
        
        maturityDateInput.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(investimentInput.snp.bottom).offset(48)
            make.height.equalTo(64)
        }
        
        rateInput.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(maturityDateInput.snp.bottom).offset(48)
            make.height.equalTo(64)
        }
        
        button.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(rateInput.snp.bottom).offset(48)
            make.height.equalTo(50)
        }
        
    }
    
    func configureViews() {
        backgroundColor = Resources.Colors.white
        button.setTitle("Simular", for: .normal)
        button.actionHandler = { [weak self] in self?.onTapToSimulate() }
    }
    
    func updateConstrantsForKeyboard(showing: Bool) {
        contentInputView.snp.updateConstraints { make in
            let topOffset = showing ? -100 : 16
            let bottomOffset = showing ? -100 : -16
            make.top.equalTo(safeAreaLayoutGuide.snp.topMargin).offset(topOffset)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottomMargin).offset(bottomOffset)
        }
    }
    
}

extension SimulationInputView {
    
    func onTapToSimulate() {
        
        guard let investiment = investimentInput.currentValue?.plain,
        let maturityDate = maturityDateInput.currentValue?.plain,
        let rate = rateInput.currentValue?.plain else {
            return
        }
        
        let simulationInput = SimulationInput(investedAmount: investiment,
                                              rate: rate,
                                              maturityDate: maturityDate)

        simulationTapHandler?(simulationInput)
        
    }
    
}

extension SimulationInputView {
    @objc func keyboardWillShow(notification: NSNotification) {
        if rateInput.inputField.isFirstResponder {
            updateConstrantsForKeyboard(showing: true)
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        updateConstrantsForKeyboard(showing: false)
    }
}
