//
//  SingleItemResultView.swift
//  SimpleInvesting
//
//  Created by Antonio Rodrigues on 19/04/19.
//  Copyright © 2019 Antonio Rodrigues. All rights reserved.
//

import UIKit

final class SingleItemResultView: UIView {
    
    private let name: UILabel = {
        let name = UILabel()
        name.textAlignment = .left
        name.font = Resources.Fonts.light(ofSize: 14)
        name.textColor = Resources.Colors.grey
        return name
    }()
    
    private let value: UILabel = {
        let name = UILabel()
        name.textAlignment = .right
        name.font = Resources.Fonts.light(ofSize: 14)
        name.textColor = Resources.Colors.black
        return name
    }()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupViewConfiguration()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("Use view coding to initialize view")
    }
    
}

extension SingleItemResultView: ViewCodingProtocol {
    
    func buildViewHierarchy() {
        addSubview(name)
        addSubview(value)
    }
    
    func setupConstraints() {
        
        
        name.snp.makeConstraints { make in
            make.left.top.bottom.equalToSuperview()
        }
        
        value.setContentCompressionResistancePriority(.required, for: .horizontal)
        
        value.snp.makeConstraints { make in
            make.right.top.bottom.equalToSuperview()
        }
        
    }
    
    func configureViews() {
        backgroundColor = Resources.Colors.white
    }
    
}

extension SingleItemResultView {
    
    public struct Configuration {
        let name: String
        let value: ValueKind
    }
    
    public func setup(with config: Configuration) {
        
    }
    
    enum ValueKind {
        
        case capital(value: Double)
        case percentage(value: Double)
        case capitalAndPercentage(capital: Double, percentage: Double)
        case date(value: Date)
        case integer(Int)
        
        //TODO: Finish it
//        var formatted: String {
//            switch self {
//            case .capital(let value):
//                break
//            case .percentage(let value):
//                break
//            case .capitalAndPercentage(let value):
//                break
//            case .date(let value):
//                break
//            case .integer(let value):
//                break
//            }
//        }
        
    }
    
}
