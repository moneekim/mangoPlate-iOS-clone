//
//  ReviewTableViewCell.swift
//  MangoPlate-iOS-clone
//
//  Created by 김모경 on 2021/08/27.
//

import UIKit

class ReviewTableViewCell: UITableViewCell {
    
    @IBOutlet weak var pictureCollectionView: UICollectionView!
    @IBOutlet weak var page: UILabel!
    @IBOutlet weak var profilePicture: UIImageView!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var reviewNum: UILabel!
    @IBOutlet weak var followerNum: UILabel!
    @IBOutlet weak var reaction: UIImageView!
    @IBOutlet weak var content: UITextView!
    @IBOutlet weak var likeNum: UILabel!
    @IBOutlet weak var commentNum: UILabel!
    @IBOutlet weak var date: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
 
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
