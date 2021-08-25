//
//  StoreCell.swift
//  MangoPlate-iOS-clone
//
//  Created by 김모경 on 2021/08/23.
//

import UIKit
import Kingfisher

class StoreCell : UICollectionViewCell{
    static let identifier = "storeCell"
    
    @IBOutlet weak var storeImage: UIImageView!
    @IBOutlet weak var storeIdx: UILabel!
    @IBOutlet weak var storeName: UILabel!
    @IBOutlet weak var storeRate: UILabel!
    @IBOutlet weak var storeLocation: UILabel!
    @IBOutlet weak var storeDistance: UILabel!
    @IBOutlet weak var storeView: UILabel!
    @IBOutlet weak var storeReview: UILabel!
    
    
    func updateUI(info: HomeResult){
        //self.storeImage
        self.storeIdx.text = "\(info.restaurantIdx)"
        self.storeName.text = info.name
        self.storeRate.text = "\(info.rating)"
        self.storeLocation.text = info.location
        //self.storeDistance.text = info.
        self.storeView.text = "\(info.views)"
        self.storeReview.text = "\(info.reviews)"
        
        print(storeName.text)
        
        guard let imagePath = info.profImg else{
            return
        }
        let something = imagePath.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
        guard let url = something , let url1 = URL(string: url)else {
            return
        }
        self.storeImage.kf.setImage(with: url1)
        //storeImage.frame.height = 156
        //storeImage.bounds.height = 156

    }
    
    
    //api 연결전 임시용
    func setUserItemCell() {
        storeImage.clipsToBounds = true
        storeImage.image = UIImage(named: "홈_맛집예시")
        storeName.text = "민속촌 갈비집"
        storeLocation.text = "광주 충장로"
    }

    
}
