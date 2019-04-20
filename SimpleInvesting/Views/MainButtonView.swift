//
//  MainButtonView.swift
//  SimpleInvesting
//
//  Created by Antonio Rodrigues on 20/04/19.
//  Copyright © 2019 Antonio Rodrigues. All rights reserved.
//

import UIKit

final class MainButtonView: UIButton {
    
    private let activityIndicator = UIActivityIndicatorView(style: .white)
    
    var actionHandler: (() -> Void)?
    
    override var isHighlighted: Bool {
        didSet {
            configureBackgroundColor()
        }
    }
    
    override var isEnabled: Bool {
        didSet {
            configureBackgroundColor()
        }
    }
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        configureButton()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("Use view coding to initialize view")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = layer.bounds.height / 2.0
    }
    
}

extension MainButtonView {
    
    private func configureButton() {
        
        setTitleColor(Resources.Colors.white, for: .normal)
        configureBackgroundColor()
        clipsToBounds = true

        titleLabel?.font = Resources.Fonts.light(ofSize: 16)

        self.addTarget(self, action: #selector(buttonWasPressed), for: .touchUpInside)
        
        configureLoading()
    }
    
    private func configureLoading() {

        addSubview(activityIndicator)
        activityIndicator.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        activityIndicator.hidesWhenStopped = true
        
    }
    
    private func configureBackgroundColor() {
        if isHighlighted {
            backgroundColor = Resources.Colors.grey
            return
        }
        if !isEnabled {
            backgroundColor = Resources.Colors.lightGrey
            return
        }
        backgroundColor = Resources.Colors.green
    }
    
}

extension MainButtonView {
    
    @objc
    private func buttonWasPressed() {
        actionHandler?()
    }
    
    func startLoading() {
        isEnabled = false
        titleLabel?.alpha = 0
        activityIndicator.startAnimating()
    }
    
    func stopLoading() {
        activityIndicator.stopAnimating()
        titleLabel?.alpha = 1
        isEnabled = true
    }
    
}
