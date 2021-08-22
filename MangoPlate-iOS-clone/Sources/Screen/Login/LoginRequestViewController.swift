//
//  LoginRequestViewController.swift
//  MangoPlate-iOS-clone
//
//  Created by 김모경 on 2021/08/19.
//

import UIKit

class LoginRequestViewController: UIViewController {

    @IBAction func skipBtn(_ sender: Any) {
        
       
        //let secondStoryboard = UIStoryboard.init(name: "Profile", bundle: nil)
        //guard let second = secondStoryboard.instantiateViewController(identifier: "ProfileViewController") as? ProfileViewController else {return}
        let secondStoryboard = UIStoryboard.init(name: "Home", bundle: nil)
        guard let second = secondStoryboard.instantiateViewController(identifier: "HomeViewController") as? HomeViewController else {return}
        second.modalPresentationStyle = .overFullScreen
        present(second, animated: true, completion: nil)
         
        
        /*
         guard let profileVC = UIStoryboard(name: "ProfileStoryboard", bundle: nil).instantiateViewController(identifier: "UnLoginProfileView") as? UnLoginViewController else {
             return
         }
         for view in containerView.subviews{
             view.removeFromSuperview()
         }
         profileVC.willMove(toParent: self)
         containerView.addSubview(profileVC.view)
         self.addChild(profileVC)
         profileVC.didMove(toParent: self)
         */
        
        
        /*
        //xib 가져오기
        let storyboard = LoginRequestViewController(nibName: "LoginRequestViewController", bundle: nil)
        
        //viewcontroller instantiation
        let storyBoard2 : UIStoryboard = UIStoryboard(name: "ProfileViewController", bundle:nil)
        let viewController = storyboard2.instantiateViewController(withIdentifier: "profile") as! ProfileViewController
        
        // viewcontroller.view = loadedXib
        self.present(viewController, animated: true, completion: nil)
        */
        

    }
    
    
    @IBAction func emailLoginBtn(_ sender: Any) {
        
        /*
        let nextVC = LoginViewController(nibName: "LoginViewController", bundle: nil)
        //let nextVC = SignUpViewController(nibName: "SignUpViewController", bundle: nil)
        nextVC.modalPresentationStyle = .overFullScreen
        self.present(nextVC, animated: true, completion: nil)
        */
        
        
    }

    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


}
