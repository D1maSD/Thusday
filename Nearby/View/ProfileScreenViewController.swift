//
//  ProfileScreenViewController.swift
//  Nearby
//
//  Created by Мельник Дмитрий on 29.08.2022.
//

import Foundation
import UIKit


class ProfileScreenViewController: ViewController {
    
    let containerView = UIImageView()
    let personInfoView = UIView()
    let personName = UILabel()
    let personStatus = UILabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpLayout()
        personInfoView.backgroundColor = .whiteColor()
    }
    
    func configure(value: UsersItem) {
        self.containerView.image = UIImage(named: value.avatarStringURL)
        self.personName.text = value.username
    }

}

extension ProfileScreenViewController {
    
    func setUpLayout() {
        
        addSubviewTo(view: containerView)
        addSubviewTo(view: personInfoView)
        addSubviewTo(view: personName)
        addSubviewTo(view: personStatus)
        personInfoView.layer.cornerRadius = 30
        
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



struct ProfileScreenProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let tabBarVC = ProfileScreenViewController()
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<ProfileScreenProvider.ContainerView>) -> ProfileScreenViewController {
            return tabBarVC
        }
        
        func updateUIViewController(_ uiViewController: ProfileScreenProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<ProfileScreenProvider.ContainerView>) {
            
        }
    }
}
