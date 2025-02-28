//
//  TabBarController.swift
//  songflow
//
//  Created by Burak Özdemir on 1.03.2025.
//

import UIKit
import SnapKit

//MARK: - TabBarController

class TabBarController: UITabBarController {

    //MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureTabBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.hidesBackButton = true
    }
}

//MARK: - Privates

private extension TabBarController {
    func configureTabBar() {
        let homepageVC = createNav(
            with: "Homepage",
            and: UIImage(systemName: "house.fill") ?? UIImage(),
            for: HomepageViewController()
        )
        let songsVC = createNav(
            with: "Songs",
            and: UIImage(systemName: "music.quarternote.3") ?? UIImage(),
            for: SongsViewController()
        )
        let chatVC = createNav(
            with: "Chat",
            and: UIImage(systemName: "bubble.left.and.bubble.right.fill") ?? UIImage(),
            for: ChatViewController()
        )
        let profileVC = createNav(
            with: "Profile",
            and: UIImage(systemName: "person.fill") ?? UIImage(),
            for: ProfileViewController()
        )
        self.setViewControllers([homepageVC, songsVC, chatVC, profileVC], animated: false)
        
        tabBar.tintColor = .init(named: Constants.primaryButtonColor)
        tabBar.unselectedItemTintColor = .lightGray
        tabBar.backgroundColor = .init(named: Constants.primaryBackgroundColor)
    }
    
    func createNav(with title: String, and image: UIImage, for vc: UIViewController) -> UINavigationController {
        let navController = UINavigationController(rootViewController: vc)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        return navController
    }
}
