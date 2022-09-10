//
//  TabBarViewController.swift
//  Nearby
//
//  Created by Мельник Дмитрий on 06.08.2022.
//

import Foundation
import UIKit


// create tabBarController

class TabBarController: UITabBarController {
    
    let boldConfiguration = UIImage.SymbolConfiguration(weight: .medium)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllers = [
            generateNavigationController(controller: UsersViewController(), image: UIImage(systemName: "person.2", withConfiguration: boldConfiguration) ?? UIImage(), title: "First"),
            generateNavigationController(controller: ChatViewController(), image: UIImage(systemName: "person.2", withConfiguration: boldConfiguration) ?? UIImage(), title: "Second"),
            generateNavigationController(controller: SignUpScreenViewController(), image: UIImage(systemName: "person.2", withConfiguration: boldConfiguration) ?? UIImage(), title: "Third"),
            generateNavigationController(controller: JoinViewController(), image: UIImage(systemName: "person.2", withConfiguration: boldConfiguration) ?? UIImage(), title: "Four"),
            generateNavigationController(controller: LoginScreenViewController(), image: UIImage(systemName: "person.2", withConfiguration: boldConfiguration) ?? UIImage(), title: "Five")
            
        ]
    }
    
    func generateNavigationController(controller: UIViewController,
                                      image: UIImage,
                                      title: String) ->
    UINavigationController {
        let navigationController = UINavigationController(rootViewController: controller)
        navigationController.tabBarItem.image = image
        navigationController.tabBarItem.title = title
        return navigationController
    }
}
