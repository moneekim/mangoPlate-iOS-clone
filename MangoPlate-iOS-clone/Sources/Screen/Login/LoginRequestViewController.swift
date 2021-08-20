//
//  LoginRequestViewController.swift
//  MangoPlate-iOS-clone
//
//  Created by 김모경 on 2021/08/19.
//

import UIKit

class LoginRequestViewController: UIViewController {

    @IBAction func skipBtn(_ sender: Any) {
        let vc = HomeViewController(nibName: "HomeViewController", bundle: nil)
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    
    @IBAction func emailLoginBtn(_ sender: Any) {
        
        let nextVC = LoginViewController(nibName: "LoginViewController", bundle: nil)
        //let nextVC = SignUpViewController(nibName: "SignUpViewController", bundle: nil)
        nextVC.modalPresentationStyle = .overFullScreen
        self.present(nextVC, animated: true, completion: nil)
    }

    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


}
