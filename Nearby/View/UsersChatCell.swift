//
//  UsersChatCell.swift
//  Nearby
//
//  Created by Мельник Дмитрий on 25.08.2022.
//

import Foundation
import UIKit



class UsersChatCell: UICollectionViewCell, CollectionCellViewModelType, ViewModelTypeProtocol {
    
    var IconImageView = UIImageView()
    var conteinerView = UIView()
    var name = UILabel()
   
    static var reuseId: String = "UsersChatCell"
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpConstraints()
        
    }
    
    func configure(value: UsersItem) {
        self.IconImageView.image = UIImage(named: value.avatarStringURL)
        self.name.text = value.username
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}


extension UsersChatCell {
    
    func setUpConstraints() {
        
        self.conteinerView.layer.cornerRadius = 4
//        self.conteinerView.layer.sha
        
        conteinerView.backgroundColor = .whiteColor()
        conteinerView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(conteinerView)
        IconImageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(IconImageView)
        name.translatesAutoresizingMaskIntoConstraints = false
        addSubview(name)
        
        NSLayoutConstraint.activate([
            IconImageView.heightAnchor.constraint(equalTo: conteinerView.widthAnchor),
            IconImageView.topAnchor.constraint(equalTo: self.topAnchor),
            IconImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            IconImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            conteinerView.topAnchor.constraint(equalTo: self.topAnchor),
            conteinerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            conteinerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            conteinerView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            name.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            name.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8)
        ])
    }
}
