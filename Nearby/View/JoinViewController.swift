//
//  ViewController.swift
//  Nearby
//
//  Created by Мельник Дмитрий on 23.07.2022.
//

import UIKit

class JoinViewController: ViewController {
    
    var logoImageView = UIImageView(image: #imageLiteral(resourceName: "Logo"))
    
    var googleButton = UIButton(title: "Google", titleColor: UIColor.blackColor(), backgroundColor: UIColor.whiteColor(), font: UIFont.avenir20()!, shadow: true)
    var emailButton = UIButton(title: "Email", titleColor: UIColor.whiteColor(), backgroundColor: UIColor.blackColor(), font: UIFont.avenir20()!, shadow: true)
    var loginButton = UIButton(title: "Login", titleColor: UIColor.blackColor(), backgroundColor: UIColor.whiteColor(), font: UIFont.avenir20()!, shadow: true)
    
    var googleLabel = UILabel(text: "Get started with")
    var emailLabel = UILabel(text: "Or sign up with")
    var loginLabel = UILabel(text: "Already onboard?")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .whiteColor()
        setUpConstraints()
    }
    
    func buttonsTapped() {
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        emailButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
    }
    
    @objc func loginButtonTapped() {
        print(#function)
    }
    
    @objc func signUpButtonTapped() {
        print(#function)
    }
}


extension JoinViewController {
    
    func setUpConstraints() {
        let startVeiw = ButtonLabelView(button: googleButton, label: googleLabel)
        let signUp = ButtonLabelView(button: emailButton, label: emailLabel)
        let loginButton = ButtonLabelView(button: loginButton, label: loginLabel)
        
        let stackView = UIStackView(arrangedSubviews: [startVeiw, signUp, loginButton])
        stackView.axis = .vertical
        stackView.spacing = 150
        addSubviewTo(view: stackView)
        addSubviewTo(view: logoImageView)
        
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 160),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 130),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}


import SwiftUI

struct ViewControllerProvider: PreviewProvider {
    
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let viewController = JoinViewController()
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<ViewControllerProvider.ContainerView>) -> some UIViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: UIViewControllerRepresentableContext<ViewControllerProvider.ContainerView>) {
            
        }
    }
}

