//
//  SignUpViewController.swift
//  MangoPlate-iOS-clone
//
//  Created by 김모경 on 2021/08/19.
//

import UIKit

protocol SendSignUpDelegate {
    func sendData(data: String, data2: String)
}

class SignUpViewController: UIViewController {
    
    
    @IBOutlet weak var emailInput: UITextField!
    @IBOutlet weak var pwdInput: UITextField!
    @IBOutlet weak var confirmPwd: UITextField!
    @IBOutlet weak var authEmailButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    var tempEmail : String = ""
    var tempPwd : String = ""

    @IBAction func editEmail(_ sender: Any) {
        authEmailButton.backgroundColor = .orange
    }
    
    @IBAction func editConfirmPwd(_ sender: Any) {
        nextButton.backgroundColor = .orange
    }
    
    @IBAction func authEmail(_ sender: Any) {
    }

    
    @IBAction func didTapNextButton(_ sender: Any) {
        
        // 옵셔널 바인딩 & 예외 처리 : Textfield가 빈문자열이 아니고, nil이 아닐 때
        guard let email = emailInput.text, !email.isEmpty else { return }
        guard let password = pwdInput.text, !password.isEmpty else { return }
//        if pwdInput == confirmPwd{
//            guard let password = pwdInput.text, !password.isEmpty else { return }
        
        tempEmail = email
        tempPwd = password
        
        //# api 연결할때 데이터 보내기 <= 스토리보드 방식으로 바꿔야함
        /*
        let nextVC = UIStoryboard.init(name: "Login", bundle: nil)
        guard let second = nextVC.instantiateViewController(identifier: "AuthPhoneNumController") as? AuthPhoneNumController else {return}
        
        second.modalPresentationStyle = .overFullScreen
        present(second, animated: true, completion: nil)
        */
        //let nextVC = AuthPhoneNumController(nibName: "AuthPhoneNumController", bundle: nil)
        //nextVC.tempEmail = email
        //nextVC.tempPwd = password
        //nextVC.modalPresentationStyle = .overFullScreen
        //self.present(nextVC, animated: true, completion: nil)
        
    
    
    
    }
    
    
    
    //var userModel = UserModel() // 인스턴스 생성
    
    // 회원 확인 method
    /*
    func isUser(id: String) -> Bool {
        for user in userModel.users {
            if user.email == id {
                return true // 이미 회원인 경우
            }
        }
        return false
    }
    */
    /*
    override func viewWillAppear(_ animated: Bool) {
            self.emailInput.becomeFirstResponder()
        }
    */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //네비게이션 바 설정
        self.navigationController?.navigationBar.tintColor = .darkGray
        self.navigationController?.navigationBar.topItem?.title = "이메일로 가입"
      
        //텍스트필드 언더라인 설정
        emailInput.borderStyle = .none
        pwdInput.borderStyle = .none
        confirmPwd.borderStyle = .none
        
        let border = CALayer()
        border.frame = CGRect(x: 0, y: emailInput.frame.size.height-1, width: emailInput.frame.width, height: 1)
        border.backgroundColor = UIColor.lightGray.cgColor
        emailInput.layer.addSublayer((border))
        
        let border2 = CALayer()
        border2.frame = CGRect(x: 0, y: pwdInput.frame.size.height-1, width: pwdInput.frame.width, height: 1)
        border2.backgroundColor = UIColor.lightGray.cgColor
        pwdInput.layer.addSublayer((border2))
        
        let border3 = CALayer()
        border3.frame = CGRect(x: 0, y: confirmPwd.frame.size.height-1, width: confirmPwd.frame.width, height: 1)
        border3.backgroundColor = UIColor.lightGray.cgColor
        confirmPwd.layer.addSublayer((border3))
        

    }
    
    // TextField 흔들기 애니메이션
    func shakeTextField(textField: UITextField) -> Void{
            UIView.animate(withDuration: 0.2, animations: {
                textField.frame.origin.x -= 10
            }, completion: { _ in
                UIView.animate(withDuration: 0.2, animations: {
                    textField.frame.origin.x += 20
                }, completion: { _ in
                    UIView.animate(withDuration: 0.2, animations: {
                        textField.frame.origin.x -= 10
                    })
                })
            })
        }

}
