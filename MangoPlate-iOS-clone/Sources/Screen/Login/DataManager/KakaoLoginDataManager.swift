//
//  KakaoLoginDataManager.swift
//  MangoPlate-iOS-clone
//
//  Created by 김모경 on 2021/08/26.
//

import Alamofire

class KakaoLoginDataManager{
    
    var didFinishFetch: (() -> ())?
    
    func usersloginkakaocode(viewController: LoginRequestViewController){
        
        AF.request("\(Constant.KAKAO_URL)", method: .get, parameters: nil)
            .validate()
            .responseDecodable(of: KakaoLoginResponse.self){ (response) in
                switch response.result{
                case .success(let response):
                    if response.isSuccess, let result = response.result {
                        DispatchQueue.main.async {
                            print("카톡 로그인 연결 성공!")
                            print(result)
                            self.didFinishFetch?()
                        }
                        return
                    }
                    else{
                        print("카톡 로그인 success > else 출력")
                        print(response.message)
                        return
                    }
                case .failure(let error):
                    print("카톡 로그인 연결 실패!")
                    print(error.localizedDescription)
                    
                }
            }

    }
}
