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

/////////////////////////////////
///
/////
//  ProfileModuleModule.swift
//  proto-ios
//
//  Created by Мельник Дмитрий on 04.09.2022.
//

import Foundation

struct ProfileModuleModule: Module {
    var modulePresentationStyle: ModulePresentationStyle {
        return .push
    }
    
    var coordinator: ApplicationOnboardingCoordinator

    func build() -> ProfileModuleViewController {
        return construct {
            return ProfileModuleViewController()
        } viewModelProvider: {
            return ProfileModuleViewModel()
        } coordinatorProvider: {
            return coordinator
        }
    }
}

//struct JoinScreenModule: Module {
//    var modulePresentationStyle: ModulePresentationStyle {
//        return .push
//    }
//
//    var coordinator: ApplicationOnboardingCoordinator
//
//    func build() -> JoinScreenViewController {
//        return construct {
//            return JoinScreenViewController()
//        } viewModelProvider: {
//            return JoinScreenViewModel()
//        } coordinatorProvider: {
//            return coordinator
//        }
//    }
//}




//
//  ProfileModuleViewController.swift
//  proto-ios
//
//  Created by Мельник Дмитрий on 04.09.2022.
//

import UIKit
import RxSwift
import SnapKit

class ProfileModuleViewController: ViewController, TargetView, ViewModelContainer {
    
    // MARK: - Public vars
    
    let disposeBag = DisposeBag()
    var viewModel: ProfileModuleViewModelProtocol!
    
    var profileImage = UIImageView()
    var nameLabel = UILabel()
    var verticalView = UIView()
    var photoCountLabel = UILabel()
    var photoLabel = UILabel()
    var videoCountLabel = UILabel()
    var videoLabel = UILabel()
    var infoTableView = UITableView()
    var logoutButton = UIButton()
    
    // MARK: - Private vars
    
    // MARK: - Overrides
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
    }
    
    
    
    
    // MARK: - Public
    
    func bind() {
        
        nameLabel.text = "Vasya Pupkin"
        photoCountLabel.text = "100"
        photoLabel.text = "Photo"
        videoCountLabel.text = "200"
        videoLabel.text = "Video"
    }
    
    override func setupLayout() {
        
//        profileImage.layer.masksToBounds = true
        profileImage.layer.cornerRadius = 64
        profileImage.backgroundColor = .systemRed
        verticalView.backgroundColor = .systemRed
        
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        
        addSubviewTo(view: verticalView)
        self.view.addSubview(profileImage)
        addSubviewTo(view: nameLabel)
        addSubviewTo(view: photoCountLabel)
        addSubviewTo(view: photoLabel)
        addSubviewTo(view: videoCountLabel)
        addSubviewTo(view: videoLabel)
        addSubviewTo(view: infoTableView)
        addSubviewTo(view: logoutButton)
        
        profileImage.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(54)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(128)
            $0.width.equalTo(128)
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(profileImage.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
        }
        
        verticalView.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(40)
            $0.centerX.equalTo(view.snp.centerX)
            $0.height.equalTo(25)
            $0.width.equalTo(1)
        }
        
        photoCountLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(30)
            $0.trailing.equalTo(verticalView).offset(-70)
        }
    
        videoCountLabel.snp.makeConstraints {
            $0.leading.equalTo(verticalView).offset(70)
            $0.centerY.equalTo(photoCountLabel.snp.centerY)
        }
        
        photoLabel.snp.makeConstraints {
            $0.top.equalTo(photoCountLabel.snp.bottom).offset(5)
            $0.centerX.equalTo(photoCountLabel.snp.centerX)
        }
        
        videoLabel.snp.makeConstraints {
            $0.top.equalTo(videoCountLabel.snp.bottom).offset(5)
            $0.centerX.equalTo(videoCountLabel.snp.centerX)
        }
        
    }
    
    // MARK: - Private
}

fileprivate enum Constants {
    static let topInset = 24
}








//
//  ProfileModuleViewModel.swift
//  proto-ios
//
//  Created by Мельник Дмитрий on 04.09.2022.
//

import RxSwift

struct ProfileModuleViewModel: ViewModel, ProfileModuleViewModelProtocol, CoordinatorContainer {
    
    var coordinator: ApplicationOnboardingCoordinator?

    func showSignIn() {
        coordinator?.navigate(to: .signIn)
    }

    func showSignUp() {
        coordinator?.navigate(to: .signUp)
    }
    

    // MARK: - Public vars

    // MARK: - Private vars

    // MARK: - Public

    // MARK: - Private
}





//
//  ViewController.swift
//  proto-ios
//
//  Created by Misha Fedorov on 03.07.2022.
//

import UIKit

class ViewController: UIViewController, BackgroundProtocol {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = backgroundColor
        setup()
        setupLayout()
    }
    
    func setup() {}
    
    func setupLayout() {}
    
    func navigationBarScrollAppearence() -> UINavigationBarAppearance {
        let navigationBarAppearence = UINavigationBarAppearance()
        navigationBarAppearence.backgroundColor = backgroundColor
        return navigationBarAppearence
    }
    
    func addSubviewTo(view: UIView) {
        self.view.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
    }
}




