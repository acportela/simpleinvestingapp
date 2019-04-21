//
//  SimulationInputViewController.swift
//  SimpleInvesting
//
//  Created by Antonio Rodrigues on 21/04/19.
//  Copyright © 2019 Antonio Rodrigues. All rights reserved.
//

import UIKit

protocol SimulationInputViewControllerDelegate: class {
    func simulationInputViewController(_ viewController: UIViewController,
                                       didRequestSimulationWithInput input: SimulationInput)
}

final class SimulationInputViewController: UIViewController {
    
    let simulationInputView = SimulationInputView()
    weak var delegate: SimulationInputViewControllerDelegate?
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Initialize this view controller with view code")
    }
    
    override func loadView() {
        self.view = simulationInputView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Simular Investimento"
        
        setupSimulateAction()
        
    }
    
}

extension SimulationInputViewController {
    
    private func setupSimulateAction() {
        simulationInputView.simulationTapHandler = { [weak self] input in
            guard let sSelf = self else { return }
            sSelf.delegate?.simulationInputViewController(sSelf, didRequestSimulationWithInput: input)
        }
    }
    
}
