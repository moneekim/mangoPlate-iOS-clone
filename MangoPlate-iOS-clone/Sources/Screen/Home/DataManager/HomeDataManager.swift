//
//  HomeDataManager.swift
//  MangoPlate-iOS-clone
//
//  Created by 김모경 on 2021/08/21.
//

import Alamofire

class HomeDataManager {
    
    func stores(id: String, viewController: HomeViewController){
        
        AF.request("\(Constant.BASE_URL)/app/stores", method: .get, parameters: nil, headers: nil)
            .validate()
            .responseDecodable(of: HomeResponse.self){ response in
                switch response.result{
                case .success(let response):
                    if response.isSuccess, let result = response.result{
                        print("식당조회 성공!")
                        //viewController.successDataService(result)
                    }
//                    else{
//                    }
                case .failure(let error):
                    print(error.localizedDescription)
                    print("식당조회 실패!")
                    
                }
            }

    }
    
}
