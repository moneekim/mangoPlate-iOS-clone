//
//  ProfileDataManager.swift
//  MangoPlate-iOS-clone
//
//  Created by 김모경 on 2021/08/23.
//

import Alamofire

class ProfileDataManager {
    
    var userInfo: UserInfo?
    var didFinishFetch: (() -> ())?
    
    
    func users(viewController: ProfileTableViewController){
        
        let headers : HTTPHeaders = ["X-ACCESS-TOKEN" : JwtToken.token]
        AF.request("\(Constant.BASE_URL)/app/users", method: .get, parameters: nil, headers: headers)
            .validate()
            .responseDecodable(of: ProfileResponse.self){ (response) in
                switch response.result{
                case .success(let response):
                    if response.isSuccess, let result = response.result {
                        //시도
                        DispatchQueue.main.async {
                            self.userInfo = result
                            print("프로필 연결 성공!")
                            print(result)
                            self.didFinishFetch?()
                        }
                        //print("프로필 연결 성공!")
                        //viewController.successDataService(result)
                        return
                    }
                    else{
                        print("success > else 출력")
                        print(response.message)
                        return
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                    print("프로필 연결 실패!")
                    
                }
            }

    }
    
}
