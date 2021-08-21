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
    let bannerList : [String] = ["홈_배너1", "홈_배너2", "홈_배너3", "홈_배너4", "홈_배너5"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //상단 배너 컬렉션 뷰
        self.bannerCollectionView.delegate = self
        self.bannerCollectionView.dataSource = self
        self.bannerCollectionView.register(UINib(nibName: "BannerCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "banner")
        
        bannerTimer()

        
    }
    
    
    //배너 자동 넘기기 시간 설정 메소드
    func bannerTimer() {
        let _: Timer = Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { (Timer) in
            self.bannerMove()
        }
    }
    
    
    //배너 움직임 메소드
    func bannerMove() {
        
        //현재페이지가 마지막 페이지일 경우
        if self.nowPage == bannerList.count-1 {
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



extension HomeViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    //컬렉션뷰 개수 설정
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        //return restuarantViewModel.numOfRestuarantInfoList
         if collectionView ==  bannerCollectionView{
             return bannerList.count
         }
         else{
            return 10
         }
        
    }
    
    
    //컬렉션뷰 셀 설정
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        /*
         guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RestuarantCell", for: indexPath) as? RestuarantCell else {
             return UICollectionViewCell()
         }
         let restuarantInfo = restuarantViewModel.restuarantInfo(at: indexPath.item)
         cell.delegate = self
         cell.updateUI(info: restuarantInfo)
         return cell
         */
        if collectionView == bannerCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "banner", for: indexPath) as? BannerCollectionViewCell else { return UICollectionViewCell() }
            cell.bannerCell.image = UIImage(named: bannerList[indexPath.row])
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "storeCell", for: indexPath) as? StoresCollectionViewCell else { return UICollectionViewCell() }
            //cell.bannerCell.image = UIImage(named: bannerList[indexPath.row])
        
            return cell
        }
        
        
    }
    
    
    //컬렉션뷰 사이즈 설정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        if collectionView == bannerCollectionView{
            return CGSize(width: self.bannerCollectionView.bounds.width, height: self.bannerCollectionView.bounds.height)
        }
        else {
            let width: CGFloat = (collectionView.bounds.width - 8)/2
            let height: CGFloat = width * 51/40
            return CGSize(width: width, height: height)
        }
    }
    
    
    //배너 컬렉션뷰 감속 끝났을 때 현재 페이지 체크
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        self.nowPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }
    
    
    

}



