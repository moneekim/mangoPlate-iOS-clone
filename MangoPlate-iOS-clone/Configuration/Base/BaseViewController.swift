//
//  BaseViewController.swift
//  MangoPlate-iOS-clone
//
//  Created by 김모경 on 2021/08/24.
//

import UIKit

/*
class BaseViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: 아래 예시들처럼 상황에 맞게 활용하시면 됩니다.
        // Navigation Bar
//        self.navigationController?.navigationBar.titleTextAttributes = [
//            .font : UIFont.NotoSans(.medium, size: 16),
//        ]
        // Background Color
//        self.view.backgroundColor = .white
    }
}*/

class BaseTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let store = createNavController(viewController: HomeViewController(), imageName: "탭바_맛집찾기-1")
        let mangopick = createNavController(viewController: MangoPickViewController(), imageName: "탭바_망고픽-1")
        let plus = createNavController(viewController: PlusViewController(), imageName: "plusButton")
        let news = createNavController(viewController: NewsViewController(), imageName: "탭바_소식-1")
        let profile = createNavController(viewController: ProfileViewController(), imageName: "탭바_내정보_color-1")
        
        viewControllers = [store, mangopick, plus, news, news, profile]
    }
    
    fileprivate func createNavController(viewController: UIViewController, imageName: String) -> UINavigationController{
        let navController = UINavigationController(rootViewController: viewController)
        viewController.view.backgroundColor = .white
        viewController.navigationItem.title = title
        navController.tabBarItem.title = title
        navController.navigationBar.prefersLargeTitles = true
        navController.tabBarItem.image = UIImage(named: imageName)
        return navController
    }
    
}

