//
//  MainCoordinator.swift
//  Nearby
//
//  Created by Мельник Дмитрий on 12.09.2022.
//

import Foundation
import UIKit


class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc =  ChatRequestViewController()
        navigationController.pushViewController(vc, animated: true)
    }
    
    func profileVC() {
        let vc =  ProfileScreenViewController()
        navigationController.pushViewController(vc, animated: true)
    }
    
    func usersVC() {
        let vc =  UsersViewController()
        navigationController.pushViewController(vc, animated: true)
    }
    
    func joinVC() {
        let vc =  JoinViewController()
        navigationController.pushViewController(vc, animated: true)
    }
    
    
}
