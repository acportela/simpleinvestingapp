//
//  SingleItemInputView.swift
//  SimpleInvesting
//
//  Created by Antonio Rodrigues on 20/04/19.
//  Copyright © 2019 Antonio Rodrigues. All rights reserved.
//

import UIKit

final class SingleItemInputView: UIView {
    
    private let inputTitle: UILabel = {
        let title = UILabel()
        title.textAlignment = .center
        title.font = Resources.Fonts.light(ofSize: 16)
        title.textColor = Resources.Colors.grey
        return title
    }()
    
    private let inputField: UITextField = {
        let value = UITextField()
        value.textAlignment = .center
        value.font = Resources.Fonts.light(ofSize: 29)
        value.textColor = Resources.Colors.grey
        value.keyboardType = .asciiCapableNumberPad
        return value
    }()
    
    var rawValueInput: String? {
        return nil
    }
    
    private let separator = UIView()
    
    init(frame: CGRect = .zero, config: SingleItemInputView.Configuration) {
        super.init(frame: frame)
        setupViewConfiguration()
        setup(with: config)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("Use view coding to initialize view")
    }
    
}

extension SingleItemInputView: ViewCodingProtocol {
    
    func buildViewHierarchy() {
        addSubview(inputTitle)
        addSubview(inputField)
        addSubview(separator)
    }
    
    func setupConstraints() {

        inputTitle.snp.makeConstraints { make in
            make.left.top.right.equalToSuperview()
        }

        inputField.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(inputTitle.snp.bottom).offset(16)
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
    }
    
}

extension SingleItemInputView {
    
    public struct Configuration {
        let inputType: SimulationItemInputType
    }
    
    public func setup(with config: Configuration) {
        inputTitle.text = config.inputType.title
        inputField.text = config.inputType.initialValue
    }
    
}

extension SingleItemInputView {
 
    enum SimulationItemInputType {
        
        case investiment
        case maturityDate
        case rate
        
        var initialValue: String {
            switch self {
            case .investiment:
                return "R$"
            case .maturityDate:
                return "dia/mês/ano"
            case .rate:
                return "100%"
            }
        }
        
        var title: String {
            switch self {
            case .investiment:
                return "Quanto você gostaria de aplicar? ⃰"
            case .maturityDate:
                return "Qual a data de vencimento do investimento? ⃰"
            case .rate:
                return "Qual o percentual do CDI do investimento? ⃰"
            }
        }
        
    }
    
}
