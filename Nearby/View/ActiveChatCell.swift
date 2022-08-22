//
//  ActiveChatCell.swift
//  Nearby
//
//  Created by Мельник Дмитрий on 14.08.2022.
//

import Foundation
import UIKit




class ActiveChatCell: UICollectionViewCell, CollectionCellViewModelType {
    
    var IconImageView = UIImageView()
    var nameLabel = UILabel()
    var messageLabel = UILabel()
    var rightView = GradientVeiw(from: .topLeading, to: .bottomTrailing, startColor: #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1), endColor: #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1))
   
    static var reuseId: String = "ActiveChatCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpConstraints()
        
    }
    
    func configure(value: ActiveItem) {
        self.IconImageView.image = UIImage(named: value.userImageString)
        self.nameLabel.text = value.username
        self.messageLabel.text = value.lastMessage
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension ActiveChatCell {
    
    func setUpConstraints() {
        IconImageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        rightView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(IconImageView)
        addSubview(nameLabel)
        addSubview(messageLabel)
        addSubview(rightView)
        
        IconImageView.backgroundColor = .systemRed
        backgroundColor = .systemTeal
        self.rightView.backgroundColor = .systemGray
        
        
        NSLayoutConstraint.activate([
            IconImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 0),
            IconImageView.widthAnchor.constraint(equalToConstant: 86),
            IconImageView.heightAnchor.constraint(equalToConstant: 86),
            IconImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor)

        ])
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),
            nameLabel.leadingAnchor.constraint(equalTo: IconImageView.trailingAnchor, constant: 15),
        ])
        
        NSLayoutConstraint.activate([
            messageLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 15),
            messageLabel.leadingAnchor.constraint(equalTo: IconImageView.trailingAnchor, constant: 15)
        ])
        
        NSLayoutConstraint.activate([
            rightView.widthAnchor.constraint(equalToConstant: 10),
            rightView.heightAnchor.constraint(equalToConstant: 86),
            rightView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            rightView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
}
