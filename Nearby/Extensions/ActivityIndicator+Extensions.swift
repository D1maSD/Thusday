//
//  CustomActivityView.swift
//  proto-ios
//
//  Created by Мельник Дмитрий on 17.08.2022.
//

import Foundation
import UIKit


class CustomActivityIndicator: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    let spinningCircle = CAShapeLayer()
    
    private func configure() {
        frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        
        let rect = bounds
        let circularPath = UIBezierPath(ovalIn: rect)
        
        spinningCircle.path = circularPath.cgPath
        spinningCircle.fillColor = UIColor.clear.cgColor
        spinningCircle.strokeColor = UIColor.systemRed.cgColor
        spinningCircle.lineWidth = 18
        spinningCircle.strokeEnd = 0.25
        spinningCircle.lineCap = .round
        
        self.layer.addSublayer(spinningCircle)
    }
    
    
    func animate() {
        UIView.animate(withDuration: 1, delay: 0, options: .curveLinear) {
            self.transform = CGAffineTransform(rotationAngle: .pi)
        } completion: { (completed) in
            UIView.animate(withDuration: 1, delay: 0, options: .curveLinear) {
                self.transform = CGAffineTransform(rotationAngle: 0)
            } completion: { (completed) in
                print("Animate()")
                self.animate()
            }

        }

    }
    
    
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
