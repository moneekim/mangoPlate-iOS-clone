//
//  StoreCell.swift
//  MangoPlate-iOS-clone
//
//  Created by 김모경 on 2021/08/23.
//

import UIKit

/*
 class UserItemCell: UICollectionViewCell {
     static let identifier = "UserItemCell"
     
     @IBOutlet weak var itemImageView: UIImageView!
     @IBOutlet weak var itemNameLabel: UILabel!
     @IBOutlet weak var itemPriceLabel: UILabel!
     
     func setUserItemCell() { //post: Post 매개변수에
         itemImageView.layer.cornerRadius = 5
         itemImageView.clipsToBounds = true
         itemImageView.image = UIImage(named: "img8")
         itemNameLabel.text = "카키색 바람막이 팜"
         itemPriceLabel.text = "30,000원"
         
     }
 }

 */

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
    
    
    func setUserItemCell() {
        storeImage.clipsToBounds = true
        storeImage.image = UIImage(named: "홈_맛집예시")
        storeName.text = "민속촌 갈비집"
        storeLocation.text = "광주 충장로"
        
    }

    
}
