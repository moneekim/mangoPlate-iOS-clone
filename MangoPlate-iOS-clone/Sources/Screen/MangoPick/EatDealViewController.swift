//
//  EatDealViewController.swift
//  MangoPlate-iOS-clone
//
//  Created by 김모경 on 2021/08/24.
//

import UIKit

class EatDealViewController: UITabBarController, UITableViewDelegate, UITableViewDataSource{

    //@IBOutlet weak var eatDealTableView: UITableView!
    
    let data = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 대리자 위임
        //eatDealTableView.delegate = self
        //eatDealTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 내가 정의한 Cell 만들기
        let cell: EatDealTableViewCell = tableView.dequeueReusableCell(withIdentifier: "EatDealCell", for: indexPath) as! EatDealTableViewCell
        // Cell Label의 내용 지정
        cell.price.text = data[indexPath.row]
                
        // 생성한 Cell 리턴
        return cell
        
        /*guard let cell = tableView.dequeueReusableCell(withIdentifier: "EatDealCell", for: indexPath) as? EatDealTableViewCell else {
            return UITableViewCell()
        }
        return cell*/
    }

}

//테이블뷰 설정
/*
extension EatDealViewController: UITableViewDelegate, UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "EatDealCell", for: indexPath) as? EatDealTableViewCell else {
            return UITableViewCell()
        }
        return cell
    }
}*/

