//
//  SimulationResultViewController.swift
//  SimpleInvesting
//
//  Created by Antonio Rodrigues on 20/04/19.
//  Copyright © 2019 Antonio Rodrigues. All rights reserved.
//

import UIKit

protocol SimulationResultViewControllerDelegate: class {
    func simulationResultViewControllerDidRequestSimulation(_ viewController: UIViewController)
}

final class SimulationResultViewController: UIViewController {
    
    let simulationResultView = SimulationResultView()
    
    var simulationResponse: SimulationResponse {
        didSet {
            setupView()
        }
    }
    
    weak var delegate: SimulationResultViewControllerDelegate?
    
    init(response: SimulationResponse) {
        simulationResponse = response
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Initialize this view controller with view code")
    }
    
    override func loadView() {
        self.view = simulationResultView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Resultado da Simulação"
        
        setupButtonAction()
        setupView()
        
    }
    
}

extension SimulationResultViewController {
    
    private func setupButtonAction() {
        simulationResultView.button.actionHandler = { [weak self] in
            guard let sSelf = self, let delegate = sSelf.delegate else { return }
            sSelf.simulationResultView.button.startLoading()
            delegate.simulationResultViewControllerDidRequestSimulation(sSelf)
        }
    }
    
    private func setupView() {
        
        guard let grossAmount = simulationResponse.grossAmount,
        let grossProfit = simulationResponse.grossAmountProfit else { return }

        let headerConfig = SimulationResultHeaderView.Configuration(grossAmount: grossAmount, profit: grossProfit)
        
        let firstSection = buildFirstSectionConfigurations()
        let secondSection = buildSecondSectionConfigurations()
        
        let simulationConfig = SimulationResultView.Configuration.init(header: headerConfig,
                                                                       firstSectionConfigurations: firstSection,
                                                                       secondSectionConfigurations: secondSection)
        simulationResultView.setup(with: simulationConfig)
    }
    
    private func buildFirstSectionConfigurations() -> [SingleItemResultView.Configuration] {
        
        var firstSectionConfigs: [SingleItemResultView.Configuration] = []
        
        if let investedAmount = simulationResponse.investmentParameter?.investedAmount {
            let config = SingleItemResultView.Configuration(name: "Valor aplicado inicialmente",
                                                            value: .capital(value: investedAmount))
            firstSectionConfigs.append(config)
        }
        
        if let grossAmount = simulationResponse.grossAmount {
            let config = SingleItemResultView.Configuration(name: "Valor bruto do investimento",
                                                            value: .capital(value: grossAmount))
            firstSectionConfigs.append(config)
        }
        
        if let grossProfit = simulationResponse.grossAmountProfit {
            let config = SingleItemResultView.Configuration(name: "Valor do rendimento",
                                                            value: .capital(value: grossProfit))
            firstSectionConfigs.append(config)
        }
        
        if let taxesAmount = simulationResponse.taxesAmount, let taxesRate = simulationResponse.taxesRate {
            let taxes = ValueKind.capitalAndRate(capital: taxesAmount, rate: taxesRate)
            let config = SingleItemResultView.Configuration(name: "IR sobre o investimento", value: taxes)
            firstSectionConfigs.append(config)
        }
        
        if let netAmount = simulationResponse.netAmount {
            let config = SingleItemResultView.Configuration(name: "Valor líquido do investimento",
                                                            value: .capital(value: netAmount))
            firstSectionConfigs.append(config)
        }
        
        return firstSectionConfigs
    }
    
    func buildSecondSectionConfigurations() -> [SingleItemResultView.Configuration] {
        
        var secondSectionConfigs: [SingleItemResultView.Configuration] = []
        
        guard let investiment = simulationResponse.investmentParameter else { return [] }
        
        if let dateString = investiment.maturityDate {
            
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
            formatter.calendar = .current
            formatter.locale = .current
            
            if let date = formatter.date(from: dateString) {
                let config = SingleItemResultView.Configuration(name: "Data de resgate", value: .date(value: date))
                secondSectionConfigs.append(config)
            }
        }
        
        if let days = investiment.maturityTotalDays {
            let config = SingleItemResultView.Configuration(name: "Dias corridos", value: .integer(days))
            secondSectionConfigs.append(config)
        }
        
        if let monthlyProfit = simulationResponse.monthlyGrossRateProfit {
            let config = SingleItemResultView.Configuration(name: "Rendimento mensal",
                                                            value: .rate(value: monthlyProfit))
            secondSectionConfigs.append(config)
        }
        
        if let rate = investiment.rate {
            let config = SingleItemResultView.Configuration(name: "Percentual do CDI do investimento",
                                                            value: .rate(value: rate))
            secondSectionConfigs.append(config)
        }
        
        if let yearlyRate = investiment.yearlyInterestRate {
            let config = SingleItemResultView.Configuration(name: "Rentabilidade anual",
                                                            value: .rate(value: yearlyRate))
            secondSectionConfigs.append(config)
        }
        
        if let rateProfit = simulationResponse.rateProfit {
            let config = SingleItemResultView.Configuration(name: "Rentabilidade no período",
                                                            value: .rate(value: rateProfit))
            secondSectionConfigs.append(config)
        }
        
        return secondSectionConfigs
    }
    
}
