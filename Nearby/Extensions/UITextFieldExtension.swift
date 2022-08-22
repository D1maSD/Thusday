//
//  UITextFieldExtension.swift
//  Nearby
//
//  Created by Мельник Дмитрий on 27.07.2022.
//

import Foundation
import UIKit


class OneLineTextField: UITextField {
    
    convenience init(text: String) {
        self.init()
        self.borderStyle = .none
        self.backgroundColor = .whiteColor()
        self.text = ""
        self.bottomView.backgroundColor = UIColor.lightGray()
        setUpConstraints()
        bottomView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    let bottomView = UIView(frame: CGRect.zero)
    
    func setUpConstraints() {
        self.addSubview(bottomView)
        NSLayoutConstraint.activate([
            bottomView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            bottomView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            bottomView.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
    
}
