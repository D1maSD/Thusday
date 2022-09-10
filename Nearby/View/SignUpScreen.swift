//
//  LogInScreen.swift
//  Nearby
//
//  Created by Мельник Дмитрий on 27.07.2022.
//

import Foundation

class SignUpScreenViewController: UIViewController {
    
    var welcomeLabel = UILabel(text: "Sveik! Hello!")
    
    
    var signUpButton = UIButton(title: "Sign up", titleColor: UIColor.blackColor(), backgroundColor: UIColor.whiteColor(), font: UIFont.avenir20()!, shadow: true)
    
    var emailLabel = UILabel(text: "Email")
    var passwordLabel = UILabel(text: "Password")
    var confirmPasswordLabel = UILabel(text: "Confirm password")
    
    let emailTextField = OneLineTextField(text: "")
    let passwordTextField = OneLineTextField(text: "")
    let confirmPasswordTextField = OneLineTextField(text: "")


    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .whiteColor()
        setUpConstraints()
    }
    
    func buttonsTapped() {
        signUpButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
    }
    
    @objc func signUpButtonTapped() {
        print(#function)
    }
    
    func setUpConstraints() {
        
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
        
        let thirdStackView = UIStackView(arrangedSubviews: [confirmPasswordLabel, confirmPasswordTextField, ])
        thirdStackView.axis = .vertical
        thirdStackView.spacing = 15
        self.view.addSubview(thirdStackView)
        thirdStackView.translatesAutoresizingMaskIntoConstraints = false
        
        let stackView = UIStackView(arrangedSubviews: [firstStackView, secondStackView, thirdStackView, signUpButton])
        stackView.axis = .vertical
        stackView.spacing = 80
        
        self.view.addSubview(stackView)
        self.view.addSubview(welcomeLabel)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        

        NSLayoutConstraint.activate([

            stackView.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 80),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            welcomeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 160),
            welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}




import SwiftUI

struct LogInScreenViewControllerProvider: PreviewProvider {
    
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let viewController = SignUpScreenViewController()
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<LogInScreenViewControllerProvider.ContainerView>) -> some UIViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: UIViewControllerRepresentableContext<LogInScreenViewControllerProvider.ContainerView>) {
            
        }
    }
}
