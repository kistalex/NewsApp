//
//
// NewsApp
// MainTabBarController.swift
//
// Created by Alexander Kist on 15.10.2023.
//

import UIKit

final class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        createTabBar()
//        setTabBarAppearance()
    }

    private func createTabBar() {
        viewControllers = [
            createViewController(
                viewController: HomeViewController(),
                title: "Домой",
                image: UIImage(named: "HomeIcon")),
            createViewController(
                viewController: FavoriteViewController(),
                title: "Избранное",
                image: UIImage(named: "FavoriteIcon")),
            createViewController(
                viewController: ProfileViewController(),
                title: "Профиль",
                image: UIImage(named: "ProfileIcon"))
        ]
    }

    private func createViewController(viewController: UIViewController, title: String, image: UIImage?) -> UINavigationController {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image
        viewController.navigationItem.largeTitleDisplayMode = .automatic
        return UINavigationController(rootViewController: viewController)
    }

//    private func setTabBarAppearance() {
//        let positionOnY: CGFloat = 10
//        let positionOnX: CGFloat = 14
//
//        let width = tabBar.bounds.width - positionOnX * 6
//        let height = tabBar.bounds.height + positionOnY * 2
//
//        let roundLayer = CAShapeLayer()
//
//        let bezierPath = UIBezierPath(
//            roundedRect: CGRect(
//                x: positionOnX * 3,
//                y: tabBar.bounds.minY - positionOnY,
//                width: width,
//                height: height),
//            cornerRadius: height / 2)
//
//        roundLayer.path = bezierPath.cgPath
//        roundLayer.fillColor = UIColor.white.cgColor
//        roundLayer.strokeColor = UIColor.main.cgColor
//        roundLayer.lineWidth = 1.2
//        tabBar.backgroundColor = .clear
//        tabBar.backgroundImage = UIImage()
//        tabBar.shadowImage = UIImage()
//
//        tabBar.layer.insertSublayer(roundLayer, at: 0)
//        tabBar.itemWidth = width / 5
//        tabBar.itemPositioning = .centered
//        tabBar.tintColor = UIColor.main
//        tabBar.unselectedItemTintColor = UIColor.unselected
//    }

}
