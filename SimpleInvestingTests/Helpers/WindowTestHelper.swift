//
//  WindowTestHelper.swift
//  SimpleInvestingTests
//
//  Created by Antonio Rodrigues on 20/04/19.
//  Copyright © 2019 Antonio Rodrigues. All rights reserved.
//

import UIKit

enum WindowTestHelper {
    
    static let window: UIWindow = UIWindow(frame: CGRect(x: 0, y: 0, width: 375, height: 667))
    
    static func show(controller: UIViewController) {
        self.window.rootViewController = controller
        self.window.makeKeyAndVisible()
    }
    
    static func clean() {
        self.window.rootViewController = nil
        self.window.isHidden = true
    }
    
}
