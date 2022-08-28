//
//  UsersChatCell.swift
//  Nearby
//
//  Created by Мельник Дмитрий on 25.08.2022.
//

import Foundation
import UIKit


class UsersChatCell: UICollectionViewCell, CollectionCellViewModelType {
    
    typealias TViewModel = UsersItem
    static var reuseId: String = "UsersChatCell"
    var userImage = UIImageView()
    var fullName: UILabel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setNeedsDisplay()
        self.backgroundColor = .systemBlue
    }
    
    func configure(value: UsersItem) {
        self.userImage.image = UIImage(named: value.avatarStringURL)
        self.fullName?.text = value.username
    }
    
    func setUpConstraints() {
        
        userImage.translatesAutoresizingMaskIntoConstraints = false
        addSubview(userImage)
        
        NSLayoutConstraint.activate([
            userImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            userImage.topAnchor.constraint(equalTo: self.topAnchor),
            userImage.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            userImage.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
