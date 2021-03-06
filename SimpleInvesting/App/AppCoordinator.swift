//
//  AppCoordinator.swift
//  SimpleInvesting
//
//  Created by Antonio Rodrigues on 18/04/19.
//  Copyright © 2019 Antonio Rodrigues. All rights reserved.
//

import Foundation
import UIKit

public protocol Coordinator: class {
    func start()
}

class AppCoordinator: Coordinator {
    
    private var navigation: UINavigationController
    
    let inputViewcController = SimulationInputViewController()
    var resultViewController: SimulationResultViewController?
    
    let service: SimpleInvestingServiceProtocol
    
    init(rootViewController: UINavigationController,
         service: SimpleInvestingServiceProtocol = SimpleInvestingService()) {
        navigation = rootViewController
        self.service = service
    }
    
    func start() {
        configureNavigationBar()
        startInputViewController()
    }
    
    func configureNavigationBar() {
        navigation.navigationBar.barTintColor = Resources.Colors.grey
        navigation.navigationBar.tintColor = Resources.Colors.white
        navigation.navigationBar.barStyle = .black
        navigation.navigationBar.isTranslucent = false
    }
    
    private func startInputViewController() {
        inputViewcController.delegate = self
        navigation.pushViewController(inputViewcController, animated: false)
    }
    
    private func startResultViewController(result: SimulationResponse) {
        let resultViewController = SimulationResultViewController(response: result)
        resultViewController.delegate = self
        self.resultViewController = resultViewController
        navigation.pushViewController(resultViewController, animated: true)
    }
    
    private func simulateWithInput(_ input: SimulationInput) {
        
        inputViewcController.simulationInputView.button.startLoading()
        
        service.simulateInvestiment(input: input) { [weak self] result in
            
            self?.inputViewcController.simulationInputView.button.stopLoading()
            
            switch result {
            case .success(let response):
                self?.startResultViewController(result: response)
            case .error(let error):
                self?.handleError(error, input: input)
            }
            
        }
    }
    
    private func handleError(_ error: Errors, input: SimulationInput) {
        
        let handler: ((UIAlertAction) -> Void) = { [weak self] _ in
            if error == .malformedURL {
                return
            }
            self?.simulateWithInput(input)
        }
        
        let alertController = UIAlertController(title: error.title,
                                            message: error.message,
                                            primaryActionTitle: error.buttonTitle,
                                            secondaryActionTitle: error.secodaryButtonTitle,
                                            handler: handler)
        
        navigation.topViewController?.present(alertController, animated: true)

    }
    
}

extension AppCoordinator: SimulationInputViewControllerDelegate {
    func simulationInputViewController(_ viewController: UIViewController,
                                       didRequestSimulationWithInput input: SimulationInput) {
        simulateWithInput(input)
    }
    
}

extension AppCoordinator: SimulationResultViewControllerDelegate {
    func simulationResultViewControllerDidRequestSimulation(_ viewController: UIViewController) {
        navigation.popViewController(animated: true)
    }
}
