//
//  CustomActivityView.swift
//  proto-ios
//
//  Created by Мельник Дмитрий on 17.08.2022.
//

import Foundation
import UIKit
import NVActivityIndicatorView


class SecondCustomActivityIndicator: UIView {
    
    public static let shared = SecondCustomActivityIndicator()

    
    private var indicator: NVActivityIndicatorView = {
        let indicator = NVActivityIndicatorView(frame: CGRect.init(x: 0, y: 0, width: 80, height: 80), type: .ballRotateChase, color: .systemTeal, padding: 50)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        return indicator
    }()
    
    func show(indicator forView: UIView) {
        indicator.startAnimating()
        forView.addSubview(indicator)
        
        NSLayoutConstraint.activate([
            indicator.topAnchor.constraint(equalTo: forView.topAnchor, constant: 0),
            indicator.bottomAnchor.constraint(equalTo: forView.bottomAnchor, constant: 0),
            indicator.leftAnchor.constraint(equalTo: forView.leftAnchor, constant: 0),
            indicator.rightAnchor.constraint(equalTo: forView.rightAnchor, constant: 0),
        ])
        indicator.bringSubviewToFront(forView)
    }
    
    func hide() {
        indicator.stopAnimating()
        indicator.removeFromSuperview()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
