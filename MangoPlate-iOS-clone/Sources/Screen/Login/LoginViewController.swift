//
//  LoginViewController.swift
//  MangoPlate-iOS-clone
//
//  Created by 김모경 on 2021/08/19.
//

import UIKit


class LoginViewController: UIViewController {

    @IBOutlet weak var emailInput: UITextField!
    @IBOutlet weak var pwdInput: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    //var userModel = UserModel() // 인스턴스 생성
    
    @IBAction func signInButton(_ sender: Any) {
        let nextVC = SignUpViewController(nibName: "SignUpViewController", bundle: nil)
                nextVC.modalPresentationStyle = .overFullScreen
                self.present(nextVC, animated: true, completion: nil)
    }

    @IBAction func didTapLoginButton(_ sender: Any) {
        // 옵셔널 바인딩 & 예외 처리 : Textfield가 빈문자열이 아니고, nil이 아닐 때
            guard let email = emailInput.text, !email.isEmpty else { return }
            guard let password = pwdInput.text, !password.isEmpty else { return }
                
        
        //api 연결
        let input = LoginInput(email: email, password: password)
        LoginDataManager().userslogIn(input, viewController: self)
        //api 연결 끝
                

        
        /*
            if userModel.isValidEmail(id: email){
                if let removable = self.view.viewWithTag(100) {
                    removable.removeFromSuperview()
                }
            }
            else {
                shakeTextField(textField: emailInput)
                let emailLabel = UILabel(frame: CGRect(x: 68, y: 350, width: 279, height: 45))
                emailLabel.text = "이메일 형식을 확인해 주세요"
                emailLabel.textColor = UIColor.red
                emailLabel.tag = 100
                    
                self.view.addSubview(emailLabel)
            } // 이메일 형식 오류
                
            if userModel.isValidPassword(pwd: password){
                if let removable = self.view.viewWithTag(101) {
                    removable.removeFromSuperview()
                }
            }
            else{
                shakeTextField(textField: pwdInput)
                let passwordLabel = UILabel(frame: CGRect(x: 68, y: 435, width: 279, height: 45))
                passwordLabel.text = "비밀번호 형식을 확인해 주세요"
                passwordLabel.textColor = UIColor.red
                passwordLabel.tag = 101
                    
                self.view.addSubview(passwordLabel)
            } // 비밀번호 형식 오류
                
            if userModel.isValidEmail(id: email) && userModel.isValidPassword(pwd: password) {
                let loginSuccess: Bool = loginCheck(id: email, pwd: password)
                if loginSuccess {
                    print("로그인 성공")
                    if let removable = self.view.viewWithTag(102) {
                        removable.removeFromSuperview()
                    }
                    self.performSegue(withIdentifier: "showMain", sender: self)
                }
                else {
                    print("로그인 실패")
                    shakeTextField(textField: emailInput)
                    shakeTextField(textField: pwdInput)
                    let loginFailLabel = UILabel(frame: CGRect(x: 68, y: 510, width: 279, height: 45))
                    loginFailLabel.text = "아이디나 비밀번호가 다릅니다."
                    loginFailLabel.textColor = UIColor.red
                    loginFailLabel.tag = 102
                        
                    self.view.addSubview(loginFailLabel)
                }
            }
        
        */
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //텍스트필드 언더라인 설정
        emailInput.borderStyle = .none
        pwdInput.borderStyle = .none
        
        let border = CALayer()
        border.frame = CGRect(x: 0, y: emailInput.frame.size.height-1, width: emailInput.frame.width, height: 1)
        border.backgroundColor = UIColor.lightGray.cgColor
        emailInput.layer.addSublayer((border))
        
        let border2 = CALayer()
        border2.frame = CGRect(x: 0, y: pwdInput.frame.size.height-1, width: pwdInput.frame.width, height: 1)
        border2.backgroundColor = UIColor.lightGray.cgColor
        pwdInput.layer.addSublayer((border2))
        
        //버튼 둥글게 만들기
        loginButton.layer.cornerRadius = 22
        
        let back = UIImage(named: "뒤로가기")
        let leftButtonItem = UIBarButtonItem(image: back, style: .plain, target: self, action: nil)
        //navigationItem.leftBarButtonItem = leftButtonItem
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: UIImageView(image: back))
        
        
        let leftInsect = 30
        let leftLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - CGFloat(leftInsect), height: view.frame.height))
        leftLabel.text = "이메일로 로그인"
        leftLabel.textColor = UIColor.orange
        //leftLabel.font = UIFont.systemFont(ofSize: 21)
        navigationItem.titleView = leftLabel
        
        UINavigationBar.appearance().barTintColor = UIColor.white
        
        

        
        
    }
    
    
    
    // 로그인 method
    /*
    func loginCheck(id: String, pwd: String) -> Bool {
        for user in userModel.users {
            if user.email == id && user.password == pwd {
                return true // 로그인 성공
            }
        }
        return false
    }*/
    
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
        
        
    // 다음 누르면 입력창 넘어가기, 완료 누르면 키보드 내려가기
    @objc func didEndOnExit(_ sender: UITextField) {
        if emailInput.isFirstResponder {
            pwdInput.becomeFirstResponder()
        }
    }
    

}

