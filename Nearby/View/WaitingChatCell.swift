//
//  ActiveChatCell.swift
//  Nearby
//
//  Created by Мельник Дмитрий on 14.08.2022.
//

import Foundation
import UIKit




class WaitingChatCell: UICollectionViewCell, CollectionCellViewModelType {
    
    var IconImageView = UIImageView()
   
    static var reuseId: String = "WaitingChatCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpConstraints()
        
    }
    
    func configure(value: ActiveItem) {
        self.IconImageView.image = UIImage(named: value.userImageString)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension WaitingChatCell {
    
    func setUpConstraints() {
        IconImageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(IconImageView)
        
        NSLayoutConstraint.activate([
            IconImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            IconImageView.topAnchor.constraint(equalTo: self.topAnchor),
            IconImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            IconImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
