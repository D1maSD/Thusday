//
//  ViewController.swift
//  Nearby
//
//  Created by Мельник Дмитрий on 23.07.2022.
//

import UIKit

class LoginScreenViewController: UIViewController {
    
    var logoImageView = UIImageView(image: #imageLiteral(resourceName: "Logo"))
    
    var loginGoogleButton = UIButton(title: "Google", titleColor: UIColor.blackColor(), backgroundColor: UIColor.whiteColor(), font: UIFont.avenir20()!, shadow: true)
    var loginButton = UIButton(title: "Login", titleColor: UIColor.whiteColor(), backgroundColor: UIColor.blackColor(), font: UIFont.avenir20()!, shadow: true)
    var signUpButton = UIButton()
    var welcomeBackLabel = UILabel(text: "Welcome Back")
    var loginGoogleLabel = UILabel(text: "Login with")
    var orLabel = UILabel(text: "or")
    var emailLabel = UILabel(text: "Email")
    var passwordLabel = UILabel(text: "Password?")
    var needAnAccLabel = UILabel(text: "Need an accunt?")
    
    let emailTextField = OneLineTextField(text: "")
    let passwordTextField = OneLineTextField(text: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .whiteColor()
        signUpButton.setTitle("Sign up", for: .normal)
        signUpButton.setTitleColor(UIColor.red, for: .normal)
        setUpConstraints()
        buttonsTapped()
    }
    
    func buttonsTapped() {
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        signUpButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
    }
    
    @objc func loginButtonTapped() {
        print(#function)
    }
    
    @objc func signUpButtonTapped() {
        print(#function)
    }
}






extension LoginScreenViewController {
    
    func setUpConstraints() {
        let loginVeiw = ButtonLabelView(button: loginGoogleButton, label: loginGoogleLabel)
        
        let firstStackView = UIStackView(arrangedSubviews: [emailLabel, emailTextField])
        firstStackView.axis = .vertical
        firstStackView.spacing = 15
        self.view.addSubview(firstStackView)
        firstStackView.translatesAutoresizingMaskIntoConstraints = false
        
        let secondStackView = UIStackView(arrangedSubviews: [passwordLabel, passwordTextField])
        secondStackView.axis = .vertical
        secondStackView.spacing = 15
        self.view.addSubview(secondStackView)
        secondStackView.translatesAutoresizingMaskIntoConstraints = false
        
        
        let stackView = UIStackView(arrangedSubviews: [firstStackView, secondStackView])
        stackView.axis = .vertical
        stackView.spacing = 60
        welcomeBackLabel.font = UIFont.avenir26()
        orLabel.font = UIFont.avenir20()
        needAnAccLabel.font = UIFont.avenir20()
        
        addSubviewTo(view: stackView)
        addSubviewTo(view: welcomeBackLabel)
        addSubviewTo(view: loginButton)
        addSubviewTo(view: needAnAccLabel)
        addSubviewTo(view: signUpButton)
        addSubviewTo(view: orLabel)
        addSubviewTo(view: loginVeiw)
        
        loginGoogleButton.addRightIcon(image: UIImage(named: "googleLogo")!)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: orLabel.bottomAnchor, constant: 50),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            welcomeBackLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            welcomeBackLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            loginVeiw.topAnchor.constraint(equalTo: welcomeBackLabel.bottomAnchor, constant: 80),
            loginVeiw.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginVeiw.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -40),
            loginVeiw.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 40)
        ])
        
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: secondStackView.bottomAnchor, constant: 50),
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -40),
            loginButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 40),
            loginButton.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        NSLayoutConstraint.activate([
            needAnAccLabel.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 50),
            needAnAccLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 40)
        ])
        NSLayoutConstraint.activate([
            signUpButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 46),
            signUpButton.leadingAnchor.constraint(equalTo: needAnAccLabel.trailingAnchor, constant: 10)
        ])
        NSLayoutConstraint.activate([
            orLabel.topAnchor.constraint(equalTo: loginGoogleButton.bottomAnchor, constant: 50),
            orLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 40)
        ])
    }
    
    func addSubviewTo(view: UIView) {
        self.view.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
    }
}


import SwiftUI

struct LoginScreenViewControllerProvider: PreviewProvider {
    
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let viewController = LoginScreenViewController()
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<LoginScreenViewControllerProvider.ContainerView>) -> some UIViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: UIViewControllerRepresentableContext<LoginScreenViewControllerProvider.ContainerView>) {
            
        }
    }
}

