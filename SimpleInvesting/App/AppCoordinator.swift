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
    
    init(rootViewController: UINavigationController) {
        navigation = rootViewController
    }
    
    func start() {
        configureNavigationBar()
        startSimulationInput()
    }
    
    func configureNavigationBar() {
        navigation.navigationBar.barTintColor = Resources.Colors.green
        navigation.navigationBar.tintColor = Resources.Colors.white
        navigation.navigationBar.barStyle = .black
        navigation.navigationBar.isTranslucent = false
    }
    
    private func startSimulationInput() {
        let inputViewcController = UIViewController()
        navigation.pushViewController(inputViewcController, animated: false)
    }
    
    private func startSimulationResult() {
        let resultViewController = UIViewController()
        navigation.pushViewController(resultViewController, animated: true)
    }
    
}
