//
//  SimulationResultHeaderView.swift
//  SimpleInvesting
//
//  Created by Antonio Rodrigues on 19/04/19.
//  Copyright © 2019 Antonio Rodrigues. All rights reserved.
//

import UIKit
import Foundation

final class SimulationResultHeaderView: UIView {
    
    private let simulationResultLabel: UILabel = {
        let name = UILabel()
        name.textAlignment = .center
        name.text = "Resultado da simulação"
        name.font = Resources.Fonts.light(ofSize: 14)
        name.textColor = Resources.Colors.grey
        return name
    }()
    
    private let grossAmountValue: UILabel = {
        let name = UILabel()
        name.textAlignment = .center
        name.font = Resources.Fonts.light(ofSize: 20)
        name.textColor = Resources.Colors.black
        return name
    }()
    
    private let profitValue: UILabel = {
        let name = UILabel()
        name.textAlignment = .center
        name.font = Resources.Fonts.light(ofSize: 14)
        name.textColor = Resources.Colors.green
        return name
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        stackView.axis = .vertical
        stackView.spacing = 8
        return stackView
    }()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupViewConfiguration()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("Use view coding to initialize view")
    }
    
}

extension SimulationResultHeaderView: ViewCodingProtocol {
    
    func buildViewHierarchy() {
        addSubview(stackView)
        stackView.addArrangedSubview(simulationResultLabel)
        stackView.addArrangedSubview(grossAmountValue)
        stackView.addArrangedSubview(profitValue)
    }
    
    func setupConstraints() {
        
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
    }
    
    func configureViews() {
        backgroundColor = Resources.Colors.white
    }
    
}

extension SimulationResultHeaderView {
    
    public struct Configuration {
        let grossAmount: Double
        let profit: Double
    }
    
    public func setup(with config: Configuration) {
        
        grossAmountValue.text = config.grossAmount.currencyDescription
        
        let hint = "Rendimento total de"
        let currencyDescription = config.profit.currencyDescription
        let profitLabel = "\(hint) \(currencyDescription)"
        let formattedLabel = NSMutableAttributedString(string: profitLabel)
        formattedLabel.setColor(color: Resources.Colors.lightGrey, forText: hint)
        formattedLabel.setColor(color: Resources.Colors.green, forText: currencyDescription)
        
        profitValue.attributedText = formattedLabel
        
    }
    
}
