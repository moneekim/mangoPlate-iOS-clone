//
//  SplashViewController.swift
//  MangoPlate-iOS-clone
//
//  Created by 김모경 on 2021/08/19.
//

import UIKit

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        usleep(2000000)
        //moveVC()
        let nextVC = LoginRequestViewController(nibName: "LoginRequestViewController", bundle: nil)
        //let nextVC = HomeViewController(nibName: "HomeViewController", bundle: nil)
        nextVC.modalPresentationStyle = .overFullScreen
        self.present(nextVC, animated: true, completion: nil)
        
        
        
        
    }

}
