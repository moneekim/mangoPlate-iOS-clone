//
//  EnterNameViewController.swift
//  MangoPlate-iOS-clone
//
//  Created by 김모경 on 2021/08/19.
//

import UIKit

class EnterNameViewController: UIViewController {

    
    @IBOutlet weak var nameInput: UITextField!
    @IBOutlet weak var frameLine: UITextField!
    
    var sentEmail = ""
    var sentPwd = ""
    var sentPhoneNum = ""
    var sentName = ""
    
    @IBAction func didTapEnterButton(_ sender: Any) {

        //api 연결
        print("보내진 이메일은?")
        print(sentEmail)
        print("보내진 비번은?")
        print(sentPwd)
        print("보내진 번호는?")
        print(sentPhoneNum)
        
        guard let nickname = nameInput.text, !nickname.isEmpty else { return }
        let input = SignUpInput(userName: nickname, password: sentPwd, email: sentEmail, phoneNum: sentPhoneNum)
        SignUpDataManager().users(input, viewController: self)
        
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
