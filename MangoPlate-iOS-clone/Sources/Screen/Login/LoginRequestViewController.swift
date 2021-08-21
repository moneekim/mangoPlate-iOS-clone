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
        //storyboard를 통해 두번쨰 화면의 storyboard ID를 참조하여 뷰 컨트롤러를 가져옵니다.
        //let svc = self.storyboard?.instantiateViewController(withIdentifier: "Home")
        /*
        guard let svc = self.storyboard?.instantiateViewController(withIdentifier: "Home")
        else {
                return
        }
        
        //화면 전환 애니메이션을 설정합니다. coverVertical 외에도 다양한 옵션이 있습니다.
        svc.modalTransitionStyle = UIModalTransitionStyle.coverVertical
        
        //인자값으로 다음 뷰 컨트롤러를 넣고 present 메소드를 호출합니다.
        self.present(svc, animated: true)
        */
//        let storyboard = UIStoryboard(name: "HomeViewController", bundle: nil)
//        let managerViewController = storyboard.instantiateViewControllerWithIdentifier("HomeViewController")
//        self.pushViewController(managerViewController, animated: true)

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
