//
//  SectionHeader.swift
//  Nearby
//
//  Created by Мельник Дмитрий on 17.08.2022.
//

import Foundation
import UIKit


class SectionHeader: UICollectionReusableView {
    
    static let reuseId = "SectionHeader"
    let title = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    func setUpConstraints() {
        title.translatesAutoresizingMaskIntoConstraints = false
        addSubview(title)
        
        NSLayoutConstraint.activate([
            title.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            title.topAnchor.constraint(equalTo: self.topAnchor),
            title.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            title.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    func configure(title: String, textColor: UIColor, font: UIFont) {
        self.title.text = title
        self.title.textColor = textColor
        self.title.font = font
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
