//
//  HomeViewController.swift
//  MangoPlate-iOS-clone
//
//  Created by 김모경 on 2021/08/19.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var bannerCollectionView: UICollectionView!
    
    @IBOutlet weak var storesCollectionView: UICollectionView!
    
    //상단 배너
    var nowPage : Int = 0
    let dataLst : [String] = ["홈_배너1", "홈_배너2", "홈_배너3", "홈_배너4", "홈_배너5"]

    let iconList : [String] = ["홈_맛집예시", "홈_맛집예시2", "홈_맛집예시3"]
    let storeList : [String] = ["1. 양인제과", "2. 쌍학", "3. 가매"]
    let distanceList : [String] = ["1.8km", "2.5km", "150m"]
    let reginList : [String] = ["광주 남구", "광주 동구", "광주 서구"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //collectionView.register(StoresCollectionViewCell.self, forCellWithReuseIdentifier: "storeCell")
//        self.collectionView.register(UINib(nibName: "StoresCollectionViewCell", bundle: Bundle.main), forCellReuseIdentifier: "storeCell")
//
        //상단 배너
        self.bannerCollectionView.delegate = self
        self.bannerCollectionView.dataSource = self
        self.bannerCollectionView.register(UINib(nibName: "BannerCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "banner")
        
        //
        self.storesCollectionView.delegate = self
        self.storesCollectionView.dataSource = self
        self.storesCollectionView.register(UINib(nibName: "StoresCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "storeCell")
        

        bannerTimer()
        
    }
    
    
    //배너 자동 넘기기 시간 설정
    func bannerTimer() {
        let _: Timer = Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { (Timer) in
            self.bannerMove()
        }
    }
    
    
    //배너 움직임
    func bannerMove() {
        
        //현재페이지가 마지막 페이지일 경우
        if self.nowPage == dataLst.count-1 {
            // 맨 처음 페이지로 돌아감
            bannerCollectionView.scrollToItem(at: NSIndexPath(item: 0, section: 0) as IndexPath, at: .right, animated: true)
            self.nowPage = 0
            return
        }
        
        //다음 페이지로 넘기기
        self.nowPage += 1
        bannerCollectionView.scrollToItem(at: NSIndexPath(item: nowPage, section: 0) as IndexPath, at: .right, animated: true)
    }
    
    
    
}



extension HomeViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    //컬렉션뷰 개수 설정
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
         if collectionView == storesCollectionView {
             return 3
         } else if collectionView == bannerCollectionView{
             return dataLst.count
         }
         else{
            return 1
         }
        
    }
    
    
    //컬렉션뷰 셀 설정
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        if collectionView == bannerCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "banner", for: indexPath) as? BannerCollectionViewCell else { return UICollectionViewCell() }
            cell.bannerCell.image = UIImage(named: dataLst[indexPath.row])
            return cell
        } else {    //collectionView == storesCollectionView
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "storeCell", for: indexPath) as? StoresCollectionViewCell else { return UICollectionViewCell() }
            
//            cell.storeImage.image = UIImage(named: iconList[indexPath.row])
//            cell.storeName.text = self.storeList[indexPath.row]
//            //cell.distanceNum.text = self.distanceList[indexPath.row]
//            //cell.region.text = self.reginList[indexPath.row]
            return cell
        }
        
        
    }
    
    
    //컬렉션뷰 사이즈 설정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        //return CGSize(width: self.bannerCollectionView.bounds.width, height: self.bannerCollectionView.bounds.height)
    
        if collectionView == storesCollectionView{
           
            //return CGSize(width: 193, height: 252)
            let width: CGFloat = (collectionView.bounds.width - 8)/2 - 1
            let height: CGFloat = width * 51/40
            return CGSize(width: width, height: height)
        }
        else {
            return CGSize(width: self.bannerCollectionView.bounds.width, height: self.bannerCollectionView.bounds.height)
        }
        /*
         if collectionView == self.btnCollectionView {
             return CGSize(width: self.btnCollectionView.bounds.width / 4 - 10, height: self.btnCollectionView.bounds.height)
         } else if collectionView == bannerCollectionView{
             return CGSize(width: self.bannerCollectionView.bounds.width, height: self.bannerCollectionView.bounds.height)
         } else if collectionView == moreCollectionView {
             return CGSize(width: 90, height: 80)
         } else {
             return CGSize(width: self.saleCollectionView.bounds.width - 80, height: self.saleCollectionView.bounds.height)
         }
         */
    
    
    
    }
    
    
    //컬렉션뷰 감속 끝났을 때 현재 페이지 체크
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        self.nowPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }

    
    
    
    
    
}

