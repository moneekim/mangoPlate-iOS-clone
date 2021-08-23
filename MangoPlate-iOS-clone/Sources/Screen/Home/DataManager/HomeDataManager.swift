//
//  HomeDataManager.swift
//  MangoPlate-iOS-clone
//
//  Created by 김모경 on 2021/08/21.
//

import Alamofire

class HomeDataManager {
    
    //시도
    weak var vc: HomeViewController?
    var restuarantInfoList: [HomeResult] = []
    
    var numOfRestuarantInfoList: Int {
        return restuarantInfoList.count
    }
    
    var trimmedRestuarantInfoList: [HomeResult]{
        var count = 0
        let value = restuarantInfoList.map { (info) -> HomeResult in
            count += 1
            return HomeResult(restaurantIdx: info.restaurantIdx, name: info.name, profImg: info.profImg, rating: info.rating, location: info.location, views: info.views, reviews: info.reviews)
        }
        return value
    }
    
    func restuarantInfo(at index: Int) -> HomeResult{
        return trimmedRestuarantInfoList[index]
    }
    //
    
    
    
    func stores(viewController: HomeViewController){
        
        AF.request("\(Constant.BASE_URL)/app/stores", method: .get, parameters: nil)
            .validate()
            .responseDecodable(of: HomeResponse.self){ response in
                switch response.result{
                case .success(let response):
                    if response.isSuccess, let result = response.result{
                        //시도
                        self.restuarantInfoList = result
                        DispatchQueue.main.async {
                            viewController.storeCollectionView.reloadData()
                        }
                        //
                        
                        print("식당조회 성공!")
                        //viewController.successDataService(result)
                    }
                    else{
                        print("success > else 출력")
                        print(response.message)
                    }
                case .failure(let error):
                    print("식당조회 실패!")
                    print(error.localizedDescription)
                }
            }

    }
    
}
