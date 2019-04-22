//
//  SimulationResultView.swift
//  SimpleInvesting
//
//  Created by Antonio Rodrigues on 20/04/19.
//  Copyright © 2019 Antonio Rodrigues. All rights reserved.
//

import UIKit

final class SimulationResultView: UIView {
    
    private let headerView = SimulationResultHeaderView()
    
    let button = MainButtonView()
    
    private let firstSectionItems: [SingleItemResultView] = {
        var initialArray: [SingleItemResultView] = []
        initialArray.reserveCapacity(5)
        for i in 1...5 {
            initialArray.append(SingleItemResultView.empty)
        }
        return initialArray
    }()
    
    private let secondSectionItems: [SingleItemResultView] = {
        var initialArray: [SingleItemResultView] = []
        initialArray.reserveCapacity(6)
        for i in 1...6 {
            initialArray.append(SingleItemResultView.empty)
        }
        return initialArray
    }()
    
    private let separator = UIView()
    
    private let scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.showsVerticalScrollIndicator = false
        scroll.bounces = false
        return scroll
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.distribution = .fillProportionally
        stackView.axis = .vertical
        stackView.spacing = 16
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

extension SimulationResultView: ViewCodingProtocol {
    
    func buildViewHierarchy() {
        
        addSubview(headerView)
        addSubview(scrollView)
        scrollView.addSubview(stackView)
        addSubview(button)
        
        firstSectionItems.forEach {
            stackView.addArrangedSubview($0)
        }
        
        stackView.addArrangedSubview(separator)
        
        secondSectionItems.forEach {
            stackView.addArrangedSubview($0)
        }
        
    }
    
    func setupConstraints() {
        
        separator.snp.makeConstraints { make in
            make.height.equalTo(20)
        }
        
        headerView.snp.makeConstraints { make in
            make.height.equalTo(100)
            make.left.equalTo(safeAreaLayoutGuide.snp.leftMargin).offset(16)
            make.right.equalTo(safeAreaLayoutGuide.snp.rightMargin).inset(16)
            make.top.equalTo(safeAreaLayoutGuide.snp.topMargin).offset(16)
        }
        
        button.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.left.equalTo(safeAreaLayoutGuide.snp.leftMargin).offset(16)
            make.right.equalTo(safeAreaLayoutGuide.snp.rightMargin).inset(16)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottomMargin).inset(16)
        }
        
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.bottom).offset(32)
            make.left.equalTo(safeAreaLayoutGuide.snp.leftMargin).offset(16)
            make.right.equalTo(safeAreaLayoutGuide.snp.rightMargin).inset(16)
            make.bottom.equalTo(button.snp.top).offset(-32)
        }
        
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalTo(button.snp.width)
        }
        
    }
    
    func configureViews() {
        backgroundColor = Resources.Colors.white
        separator.backgroundColor = Resources.Colors.white
        button.setTitle("Simular Novamente", for: .normal)
    }
    
}

extension SimulationResultView {
    
    public struct Configuration {
        let header: SimulationResultHeaderView.Configuration
        let firstSectionConfigurations: [SingleItemResultView.Configuration]
        let secondSectionConfigurations: [SingleItemResultView.Configuration]
    }
    
    public func setup(with config: Configuration) {
        
        headerView.setup(with: config.header)
        
        for index in 0..<firstSectionItems.count {
            
            guard config.firstSectionConfigurations.indices.contains(index) else {
                break
            }

            let config = config.firstSectionConfigurations[index]
            firstSectionItems[index].setup(with: config)
            
        }
        
        for index in 0..<secondSectionItems.count {
            
            guard config.secondSectionConfigurations.indices.contains(index) else {
                break
            }
            
            let config = config.secondSectionConfigurations[index]
            secondSectionItems[index].setup(with: config)
            
        }
        
    }
    
}
