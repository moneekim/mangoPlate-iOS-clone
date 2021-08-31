//
//  LoginRequestViewController.swift
//  MangoPlate-iOS-clone
//
//  Created by 김모경 on 2021/08/19.
//

import UIKit
import KakaoSDKCommon
import KakaoSDKAuth
import KakaoSDKUser

class LoginRequestViewController: UIViewController {

    //추가
    var kakaoLoginDataManager = KakaoLoginDataManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //이거
        //self.autoKakaoLogin()
        
    }
    
    
    @IBAction func skipBtn(_ sender: Any) {
        //탭바 시도!
        /*
        let secondStoryboard = UIStoryboard.init(name: "Home", bundle: nil)
        guard let second = secondStoryboard.instantiateViewController(identifier: "HomeViewController") as? HomeViewController else {return}
        second.modalPresentationStyle = .overFullScreen
        present(second, animated: true, completion: nil)
         */
        guard let mainTabBarController = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(identifier: "TabBarViewController") as? TabBarViewController
        else{return}
        mainTabBarController.modalPresentationStyle = .overFullScreen
        present(mainTabBarController, animated: true, completion: nil)
        //self.changeRootViewController(mainTabBarController)
        
    }
    
    
    @IBAction func emailLoginBtn(_ sender: Any) {
        /*
        let nextVC = LoginViewController(nibName: "LoginViewController", bundle: nil)
        //let nextVC = SignUpViewController(nibName: "SignUpViewController", bundle: nil)
        nextVC.modalPresentationStyle = .overFullScreen
        self.present(nextVC, animated: true, completion: nil)
        */
        /*
        let secondStoryboard = UIStoryboard.init(name: "Login", bundle: nil)
        guard let second = secondStoryboard.instantiateViewController(identifier: "ProfileViewController") as? ProfileViewController else {return}
        second.modalPresentationStyle = .overFullScreen
        present(second, animated: true, completion: nil)
        */
        
    }
    

    @IBAction func kakaoLoginBtn(_ sender: Any) {
        
        // 추가 : 카카오 로그인
        // 시뮬레이터에 카카오톡 설치 되었을 경우
        // 카카오톡 설치 여부 확인
        print("카카오톡 로그인 시도")
        if (UserApi.isKakaoTalkLoginAvailable()) {
            print("-> KakaoTalkLoginAvailable")

            UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
                print("completion")
                if let error = error {
                    print("login error")
                    print(error)
                }
                else {
                    print("loginWithKakaoTalk() success.")
                    print("loginWithKakaoAccount() Success")
                    _ = oauthToken
                }
            }
        }
    
        
        //KakaoLoginDataManager().usersloginkakaocode(viewController: self)
        
        //이거
        //self.requestKakaoLogin()
        
        
    }
    
}


/*
extension LoginRequestViewController{
    
    //api 연결
    
    //kakaoLoginDataManager.
    //LoginDataManager().userslogIn(input, viewController: self)
    //api 연결 끝
    
    func autoKakaoLogin(){
        if let key = UserDefaults.standard.string(forKey: "JwtToken") {
            
            JwtToken.token = key
            JwtToken.userId = UserDefaults.standard.integer(forKey: "UserId")
            JwtToken.isLogin = true
            print(JwtToken.token)
            
            DispatchQueue.main.async {
                guard let vc = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "TabBarId") as? TabBar2ViewController else{
                    return
                }
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true, completion: nil)
            }
        }
        //print(UserDefaults.standard.string(forKey: "JwtToken"))
    }
    
    
    // MARK: 카카오 로그인 할 때 호출되는 함수
    func requestKakaoLogin(){
        /*
         // 추가 : 카카오 로그인
         if (AuthApi.isKakaoTalkLoginAvailable()) {
           print("-> KakaoTalkLoginAvailable")
           AuthApi.shared.loginWithKakaoTalk {(oauthToken, error) in
             print("completion")
             if let error = error {
               print("login error")
               print(error)
             }
             else {
               print("loginWithKakaoTalk() success.")
               //do something
               _ = oauthToken
             }
           }
         }
         */
        UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
                if let error = error { print(error) }
                else {
                    //do something
                    guard let tokenInfo = oauthToken else{
                        return
                    }
                    print("여기주목!!")
                    print(tokenInfo.accessToken)
                    self.jwtRequestViewModel.accessTokenSave(key: tokenInfo.accessToken)
                    self.jwtRequestViewModel.getJwtAPI()
                    self.jwtRequestViewModel.didFinishFetch = {
                        JwtToken.isLogin = true
                        self.successLogin()
                    }
                }
            }
    }
    
    // MARK: 카카오 로그인이 성공했다면 , RootViewController를 바꾸면서 화면 이동하기
    func successLogin(){
        print("loginWithKakaoAccount() success.")
        guard let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RequestLocationView") as? RequestLocationViewController else{
            return
        }
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
}
*/

