//
//  LoginDataManager.swift
//  MangoPlate-iOS-clone
//
//  Created by 김모경 on 2021/08/19.
//
//import UIKit
import Alamofire

class LoginDataManager{
    
    func userslogIn(_ parameters: LoginInput, viewController: LoginViewController){
        AF.request("\(Constant.BASE_URL)/app/users/logIn", method: .post, parameters: parameters, encoder: JSONParameterEncoder.default)
            .validate()
            .responseDecodable(of: LoginResponse.self){ response in
                switch response.result{
                case .success(let response):
                    print("로그인 성공 !")
                    
                    
                case .failure(let error):
                    print("로그인 실패 !")
                }
            }
    }
}
