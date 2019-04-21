//
//  SimulationInputView.swift
//  SimpleInvesting
//
//  Created by Antonio Rodrigues on 20/04/19.
//  Copyright © 2019 Antonio Rodrigues. All rights reserved.
//

import UIKit

final class SimulationInputView: UIView {
    
    private let investimentInput: SingleItemInputView
    private let maturityDateInput: SingleItemInputView
    private let rateInput: SingleItemInputView
    
    let button = MainButtonView()
    
    private let contentInputView = UIView()
    
    override init(frame: CGRect = .zero) {
        
        let investimentConfig = SingleItemInputView.Configuration(inputType: .investiment)
        let maturityDateConfig = SingleItemInputView.Configuration(inputType: .maturityDate)
        let rateConfig = SingleItemInputView.Configuration(inputType: .rate)
        
        investimentInput = SingleItemInputView(config: investimentConfig)
        maturityDateInput = SingleItemInputView(config: maturityDateConfig)
        rateInput = SingleItemInputView(config: rateConfig)
        
        super.init(frame: frame)
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
            make.top.equalToSuperview().offset(64)
            make.height.equalTo(66)
        }
        
        maturityDateInput.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(investimentInput.snp.bottom).offset(48)
            make.height.equalTo(66)
        }
        
        rateInput.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(maturityDateInput.snp.bottom).offset(48)
            make.height.equalTo(66)
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
        button.isEnabled = false
    }
    
}
