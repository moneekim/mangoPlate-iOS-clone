//
//  ProfileTableViewController.swift
//  MangoPlate-iOS-clone
//
//  Created by 김모경 on 2021/08/22.
//

import UIKit

class ProfileTableViewController: UITableViewController {

    /*
     var userIdx : Int?
     var email : String?
     var phoneNum : String?
     */
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var followNum: UILabel!
    @IBOutlet weak var followingNum: UILabel!
    @IBOutlet weak var reviewNum: UILabel!
    @IBOutlet weak var wentNum: UILabel!
    @IBOutlet weak var photoNum: UILabel!
    @IBOutlet weak var wishNum: UILabel!
    
    
//    var sentEmail = ""
//    var sentPwd = ""
//    var sentPhoneNum = ""
    var sentName = ""
    
    
    var userInfo: UserInfo?
    var profileDataManager = ProfileDataManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        //회원가입-이름 입력 화면에서 입력한 이름 받아와서 내 정보 화면에 이름항목에 넣기
        let secondStoryboard = UIStoryboard.init(name: "Login", bundle: nil)
        guard let second = secondStoryboard.instantiateViewController(identifier: "EnterNameViewController") as? EnterNameViewController else {return}
        //self.name?.text = second.nameInput.text
        
        
        //시도
        profileDataManager.users(viewController: self)
        profileDataManager.didFinishFetch = {
            guard let data = self.profileDataManager.userInfo else {
                return
            }
            
            //self.image.text = data.profImg
            self.name.text = data.userName
            self.followNum.text = "\(data.follower)"
            self.followingNum.text = "\(data.following)"
            self.reviewNum.text = "\(data.reviews)"
            self.wentNum.text = "\(data.went)"
            self.photoNum.text = "\(data.photos)"
            self.wishNum.text = "\(data.wish)"
    
            guard let userImageURL = URL(string: data.profImg) else {
                return
            }
            //cell.bannerCell.image = UIImage(named: bannerList[indexPath.row])
            //self.image = UIImageView(userImageURL)
            self.image.kf.setImage(with: userImageURL)
        }
    

    }

    
    
    /*
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }*/
    
    
    
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */



    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */


}

extension ProfileTableViewController {
    // MARK: - Table view data source
    
    //테이블 뷰 헤더 섹션의 높이 설정
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat{
        return 10.0
    }

    //테이블 뷰 해더 섹션 폰트, 폰트크기 정하기
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int){
        let header = view as! UITableViewHeaderFooterView
        header.contentView.backgroundColor = #colorLiteral(red: 0.9635811237, green: 0.9635811237, blue: 0.9635811237, alpha: 1)
    }
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//    }
    
    
    
}
