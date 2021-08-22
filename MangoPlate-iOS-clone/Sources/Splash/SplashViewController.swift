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
        //usleep(2000000)
        
        /*
        guard let vc = UIStoryboard(name: "Login", bundle: nil).instantiateViewController(withIdentifier: "LoginRequestViewController") as? LoginRequestViewController else{
            return
        }*/
        
        /*
        let storyboard = UIStoryboard(name: "Login", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "LoginRequestViewController") as! UINavigationController
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
        */
        
        /*
         guard let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RequestLocationView") as? RequestLocationViewController else{
             return
         */
        
        /*
        guard let vc = UIStoryboard(name: "Login", bundle: nil).instantiateViewController(identifier: <#T##String#>)
        let nextVC = LoginRequestViewController(nibName: "LoginRequestViewController", bundle: nil)
        //let nextVC = HomeViewController(nibName: "HomeViewController", bundle: nil)
        nextVC.modalPresentationStyle = .overFullScreen
        self.present(nextVC, animated: true, completion: nil)
        */
        
        
        
    }

}
