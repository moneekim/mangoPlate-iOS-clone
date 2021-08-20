//
//  SignUpDataManager.swift
//  MangoPlate-iOS-clone
//
//  Created by 김모경 on 2021/08/19.
//

import Alamofire

class SignUpDataManager{
    
    //SignUpViewController => EnterNameViewController로 바꿈
    func users(_ parameters: SignUpInput, viewController: EnterNameViewController){
        AF.request("\(Constant.BASE_URL)/app/users", method: .post, parameters: parameters, encoder: JSONParameterEncoder.default)
            .validate()
            .responseDecodable(of: SignUpResponse.self){ response in
                switch response.result{
                case .success(let response):
                    print("회원가입 성공 !")
                case .failure(let error):
                    print("회원가입 실패 !")
                }
            }
    }
}

