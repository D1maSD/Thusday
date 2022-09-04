//
//  ProfileScreenViewController.swift
//  Nearby
//
//  Created by Мельник Дмитрий on 29.08.2022.
//

import Foundation
import UIKit


class ChatRequestViewController: ViewController {
    
    let containerView = UIImageView()
    let personInfoView = UIView()
    let personName = UILabel()
    let personStatus = UILabel()
    
    
    var customView = GradientVeiw(from: .topLeading, to: .bottomTrailing, startColor: #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1), endColor: #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1))
    
    
    var acceptButton = UIButton(title: "ACCEPT", titleColor: UIColor.whiteColor(), backgroundColor: UIColor.clear, font: UIFont.avenir20()!, shadow: true)
    
//    var denyButton = UIButton(title: "Deny", titleColor: UIColor.whiteColor(), backgroundColor: .clear, font: UIFont.avenir20()!, shadow: true)
    var denyButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpLayout()
        
        
        personInfoView.backgroundColor = .whiteColor()
        acceptButton.addSubview(customView)
        acceptButton.sendSubviewToBack(customView)
        denyButton.setTitle("Deny", for: .normal)
        
    }
    
    func configure(value: UsersItem) {
        self.containerView.image = UIImage(named: value.avatarStringURL)
        self.personName.text = value.username
    }

}

extension ChatRequestViewController {
    
    func setUpLayout() {
        
        addSubviewTo(view: containerView)
        addSubviewTo(view: personInfoView)
        addSubviewTo(view: personName)
        addSubviewTo(view: personStatus)
        addSubviewTo(view: acceptButton)
        addSubviewTo(view: denyButton)
        
//        denyButton.backgroundColor = .systemRed
        acceptButton.backgroundColor = .systemRed
        
        denyButton.setUpBackgroundView(view: customView)
        
        
        
        acceptButton.layer.cornerRadius = 10
        denyButton.layer.cornerRadius = 10


        personInfoView.layer.cornerRadius = 30
        
        NSLayoutConstraint.activate([
            acceptButton.heightAnchor.constraint(equalToConstant: 64),
            acceptButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 26),
            acceptButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -31),
            acceptButton.widthAnchor.constraint(equalToConstant: (self.view.frame.width - 67)/2)
        ])
        
        NSLayoutConstraint.activate([
            denyButton.heightAnchor.constraint(equalToConstant: 64),
            denyButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -26),
            denyButton.centerYAnchor.constraint(equalTo: self.acceptButton.centerYAnchor),
            denyButton.widthAnchor.constraint(equalToConstant: (self.view.frame.width - 67)/2)
        ])
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: self.view.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            personInfoView.heightAnchor.constraint(equalToConstant: 200),
            personInfoView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            personInfoView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            personInfoView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            personName.topAnchor.constraint(equalTo: self.personInfoView.topAnchor, constant: 20),
            personName.leadingAnchor.constraint(equalTo: self.personInfoView.leadingAnchor, constant: 8)
        ])
        
        NSLayoutConstraint.activate([
            personStatus.topAnchor.constraint(equalTo: self.personName.bottomAnchor, constant: 20),
            personStatus.leadingAnchor.constraint(equalTo: self.personInfoView.leadingAnchor, constant: 8)
        ])
    }
}

// MARK: Create canvas
import SwiftUI



struct ChatRequestViewProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let tabBarVC = ChatRequestViewController()
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<ChatRequestViewProvider.ContainerView>) -> ChatRequestViewController {
            return tabBarVC
        }
        
        func updateUIViewController(_ uiViewController: ChatRequestViewProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<ChatRequestViewProvider.ContainerView>) {
            
        }
    }
}
