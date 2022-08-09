//
//  LogInScreen.swift
//  Nearby
//
//  Created by Мельник Дмитрий on 27.07.2022.
//

import Foundation

class SetUpProfileViewController: UIViewController {
    
    
    
    var photoView = UIView()
    
    var goToChatsButton = UIButton(title: "Go to chats!", titleColor: UIColor.whiteColor(), backgroundColor: UIColor.blackColor(), font: UIFont.avenir20()!, shadow: true)
    
    var setUpProfileLabel = UILabel(text: "Set Up profile")
    var follNameLabel = UILabel(text: "Full name")
    var abuotMeLabel = UILabel(text: "About me")
    var sexLabel = UILabel(text: "sex")
    
    let fullNameTextField = OneLineTextField(text: "")
    let aboutMeTextField = OneLineTextField(text: "")
    let segmentControlSex = UISegmentedControl(items: ["Male", "Female"])
    let profileView = UIImageView()
    let plusProfileView = UIImageView()
    


    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .whiteColor()
        setUpConstraints()
        

    }
    
    func setUpConstraints() {
        
        let firstStackView = UIStackView(arrangedSubviews: [follNameLabel, fullNameTextField])
        firstStackView.axis = .vertical
        firstStackView.spacing = 15
        self.view.addSubview(firstStackView)
        firstStackView.translatesAutoresizingMaskIntoConstraints = false
        
        let secondStackView = UIStackView(arrangedSubviews: [abuotMeLabel, aboutMeTextField])
        secondStackView.axis = .vertical
        secondStackView.spacing = 15
        self.view.addSubview(secondStackView)
        secondStackView.translatesAutoresizingMaskIntoConstraints = false
        
        let thirdStackView = UIStackView(arrangedSubviews: [sexLabel, segmentControlSex ])
        thirdStackView.axis = .vertical
        thirdStackView.spacing = 15
        self.view.addSubview(thirdStackView)
        thirdStackView.translatesAutoresizingMaskIntoConstraints = false
        
        let stackView = UIStackView(arrangedSubviews: [firstStackView, secondStackView, thirdStackView])
        stackView.axis = .vertical
        stackView.spacing = 50
        stackView.translatesAutoresizingMaskIntoConstraints = false
        photoView.translatesAutoresizingMaskIntoConstraints = false
        setUpProfileLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(stackView)
        self.view.addSubview(photoView)
        self.view.addSubview(setUpProfileLabel)
        self.view.addSubview(goToChatsButton)
        self.view.addSubview(segmentControlSex)
        self.view.addSubview(profileView)
        self.view.addSubview(plusProfileView)

        segmentControlSex.translatesAutoresizingMaskIntoConstraints = false
        goToChatsButton.translatesAutoresizingMaskIntoConstraints = false
        setUpProfileLabel.font = UIFont.avenir26()
        
        profileView.translatesAutoresizingMaskIntoConstraints = false
        plusProfileView.translatesAutoresizingMaskIntoConstraints = false
        
        profileView.image = UIImage(named: "avatar")
        plusProfileView.image = UIImage(named: "plus")
        
        
//        segmentControlSex.setTitle("Male", forSegmentAt: 0)
        


        
        NSLayoutConstraint.activate([
            setUpProfileLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 160),
            setUpProfileLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: profileView.bottomAnchor, constant: 80),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            segmentControlSex.topAnchor.constraint(equalTo: sexLabel.bottomAnchor, constant: 15),
            segmentControlSex.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -40),
            segmentControlSex.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 40),
            segmentControlSex.heightAnchor.constraint(equalToConstant: 40)
        ])
        
      
        NSLayoutConstraint.activate([
            goToChatsButton.topAnchor.constraint(equalTo: segmentControlSex.bottomAnchor, constant: 50),
            goToChatsButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -40),
            goToChatsButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 40),
            goToChatsButton.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        NSLayoutConstraint.activate([
            profileView.topAnchor.constraint(equalTo: setUpProfileLabel.bottomAnchor, constant: 50),
            profileView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 120),
            profileView.heightAnchor.constraint(equalToConstant: 100),
            profileView.widthAnchor.constraint(equalToConstant: 90)
        ])
        
        NSLayoutConstraint.activate([
            plusProfileView.topAnchor.constraint(equalTo: setUpProfileLabel.bottomAnchor, constant: 80),
            plusProfileView.leadingAnchor.constraint(equalTo: profileView.trailingAnchor, constant: 30),
            plusProfileView.heightAnchor.constraint(equalToConstant: 30),
            plusProfileView.widthAnchor.constraint(equalToConstant: 30),
            
        ])
        
        NSLayoutConstraint.activate([
            goToChatsButton.topAnchor.constraint(equalTo: segmentControlSex.bottomAnchor, constant: 50),
            goToChatsButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -40),
            goToChatsButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 40),
            goToChatsButton.heightAnchor.constraint(equalToConstant: 60)
        ])
        
    }
}




import SwiftUI

struct SetUpProfileViewControllerProvider: PreviewProvider {
    
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let viewController = SetUpProfileViewController()
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<SetUpProfileViewControllerProvider.ContainerView>) -> some UIViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: UIViewControllerRepresentableContext<SetUpProfileViewControllerProvider.ContainerView>) {
            
        }
    }
}
