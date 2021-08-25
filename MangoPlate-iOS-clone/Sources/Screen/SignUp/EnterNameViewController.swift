//
//  EnterNameViewController.swift
//  MangoPlate-iOS-clone
//
//  Created by 김모경 on 2021/08/19.
//

import UIKit

class EnterNameViewController: UIViewController {

    
    @IBOutlet weak var backNaviBtn: UINavigationItem!
    @IBOutlet weak var nameInput: UITextField!
    @IBOutlet weak var frameLine: UITextField!
    @IBOutlet weak var enterButton: UIButton!
    
    var sentEmail : String = ""
    var sentPwd : String = ""
    var sentPhoneNum : String = ""
    var sentName : String = ""
//    var sentPwd = ""
//    var sentPhoneNum = ""
//    var sentName = ""
    
    @IBAction func editName(_ sender: Any) {
        enterButton.backgroundColor = .orange
    }
    

    @IBAction func didTapEnterButton(_ sender: Any) {
        
        //api 연결
        
        //시도
        let storyboard = UIStoryboard.init(name: "Login", bundle: nil)
        guard let vc = storyboard.instantiateViewController(identifier: "SignUpViewController") as? SignUpViewController else {return}
        
        let storyboard2 = UIStoryboard.init(name: "Login", bundle: nil)
        guard let vc2 = storyboard2.instantiateViewController(identifier: "AuthPhoneNumController") as? AuthPhoneNumController else {return}
        
        sentEmail = vc.tempEmail
        sentPwd = vc.tempPwd
        //sentEmail = vc.emailInput.text
        //sentPwd = vc.confirmPwd.text
        sentPhoneNum = vc2.tempNum
    
        print("보내진 이메일은?")
        print(sentEmail)
        print("보내진 비번은?")
        print(sentPwd)
        print("보내진 번호는?")
        print(sentPhoneNum)
    
        guard let nickname = nameInput.text, !nickname.isEmpty else { return }
        //let input = SignUpInput(userName: nickname, password: sentPwd, email: sentEmail, phoneNum: sentPhoneNum)
        let input = SignUpInput(userName: nickname, password: sentPwd, email: sentEmail, phoneNum: sentPhoneNum)
        SignUpDataManager().users(input, viewController: self)
        
        //내 정보 화면으로 이동
        let secondStoryboard = UIStoryboard.init(name: "Home", bundle: nil)
        guard let second = secondStoryboard.instantiateViewController(identifier: "HomeViewController") as? HomeViewController else {return}
        second.modalPresentationStyle = .overFullScreen
        present(second, animated: true, completion: nil)
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameInput.borderStyle = .none
        frameLine.borderStyle = .none
        let border = CALayer()
        border.frame = CGRect(x: 0, y: frameLine.frame.size.height-1, width: frameLine.frame.width, height: 1)
        border.backgroundColor = UIColor.lightGray.cgColor
        frameLine.layer.addSublayer((border))

    }
    
}
