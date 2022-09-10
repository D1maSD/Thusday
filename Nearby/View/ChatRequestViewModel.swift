//
//  ChatRequestViewModel.swift
//  Nearby
//
//  Created by Мельник Дмитрий on 30.08.2022.
//

import Foundation




//
//  ProfileModuleModule.swift
//  proto-ios
//
//  Created by Мельник Дмитрий on 04.09.2022.
//

//import Foundation
//
//struct ProfileModuleModule: Module {
//    var modulePresentationStyle: ModulePresentationStyle {
//        return .push
//    }
//    
//    var coordinator: ApplicationOnboardingCoordinator
//
//    func build() -> ProfileModuleViewController {
//        return construct {
//            return ProfileModuleViewController()
//        } viewModelProvider: {
//            return ProfileModuleViewModel()
//        } coordinatorProvider: {
//            return coordinator
//        }
//    }
//}
//
////struct JoinScreenModule: Module {
////    var modulePresentationStyle: ModulePresentationStyle {
////        return .push
////    }
////
////    var coordinator: ApplicationOnboardingCoordinator
////
////    func build() -> JoinScreenViewController {
////        return construct {
////            return JoinScreenViewController()
////        } viewModelProvider: {
////            return JoinScreenViewModel()
////        } coordinatorProvider: {
////            return coordinator
////        }
////    }
////}
//
//
//
//
//
//
//
//
//
////
////  ProfileModuleViewModel.swift
////  proto-ios
////
////  Created by Мельник Дмитрий on 04.09.2022.
////
//
//import RxSwift
//
//struct ProfileModuleViewModel: ViewModel, ProfileModuleViewModelProtocol, CoordinatorContainer {
//    
//    var coordinator: ApplicationOnboardingCoordinator?
//
//    func showSignIn() {
//        coordinator?.navigate(to: .signIn)
//    }
//
//    func showSignUp() {
//        coordinator?.navigate(to: .signUp)
//    }
//    
//
//    // MARK: - Public vars
//
//    // MARK: - Private vars
//
//    // MARK: - Public
//
//    // MARK: - Private
//}
