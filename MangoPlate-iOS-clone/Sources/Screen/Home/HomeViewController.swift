//
//  HomeViewController.swift
//  MangoPlate-iOS-clone
//
//  Created by 김모경 on 2021/08/19.
//

import UIKit

class HomeViewController: UIViewController{
    
    @IBOutlet weak var ItemInfoScrollView: UIScrollView!
    @IBOutlet weak var bannerCollectionView: UICollectionView!
    @IBOutlet weak var storeCollectionView: UICollectionView!
    
    //시도
    let restuarantViewModel = HomeDataManager()
    
    
    //상단 배너
    var currentPage : Int = 0
    let bannerList : [String] = ["홈_배너1", "홈_배너2", "홈_배너3", "홈_배너4", "홈_배너5"]
    
    var storeCell: StoreCell?
    
    //가져올 데이터 변수들
    var restaurantIdx : Int?
    var name : String? = ""
    var profImg : String?
    var rating : Float?
    var location : String? = ""
    var views : Int?
    var reviews : Int?
    
    
    func updateAPI(){
        restuarantViewModel.vc = self
        restuarantViewModel.stores(viewController: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.updateAPI()
        //api 시도
        //HomeDataManager().stores(viewController: self)
    

        //상단 배너
        bannerCollectionView.delegate = self
        bannerCollectionView.dataSource = self
        bannerCollectionView.register(UINib(nibName: "BannerCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "banner")
        bannerTimer()
        
        //bannerCollectionView.isPagingEnabled = true
        //bannerCollectionView.decelerationRate = .normal
        //startAutoScroll()
        
        storeCollectionView.delegate = self
        storeCollectionView.dataSource = self

        ItemInfoScrollView.delegate = self
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        HomeDataManager().stores(viewController: self)
    }
    
    func setItemInfo(){
        if let storeCell = storeCell {
        }
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
        if self.currentPage == bannerList.count-1 {
            // 맨 처음 페이지로 돌아감
            bannerCollectionView.scrollToItem(at: NSIndexPath(item: 0, section: 0) as IndexPath, at: .right, animated: true)
            self.currentPage = 0
            return
        }
        
        //다음 페이지로 넘기기
        self.currentPage += 1
        bannerCollectionView.scrollToItem(at: NSIndexPath(item: currentPage, section: 0) as IndexPath, at: .right, animated: true)
    }
    
    
    func startAutoScroll() {
            //전체 cell 개수
            let totalCellCount = bannerCollectionView.numberOfItems(inSection: 0)
            DispatchQueue.global(qos: .default).async {
                while true
                {
                    //2초에 한 번씩 paging
                    sleep(2)
                    
                    DispatchQueue.main.async {
                        self.bannerCollectionView.scrollToItem(at: IndexPath(item: self.currentPage, section: 0), at: .right, animated: true)
                        
                        //다시 처음으로
                        if self.currentPage == totalCellCount - 1 {
                            self.currentPage = 0
                        }
                        else {
                            self.currentPage += 1
                        }
                    }
                }
                
            }
        }
    
}


extension HomeViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    //컬렉션뷰 개수 설정
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == bannerCollectionView{
            return bannerList.count
        }
        else if collectionView == storeCollectionView{
            //return 30
            return restuarantViewModel.numOfRestuarantInfoList
        }
        else{
            return 0
        }
    }
    
    
    //컬렉션뷰 셀 설정
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == self.bannerCollectionView{
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "banner", for: indexPath) as? BannerCollectionViewCell else { return UICollectionViewCell() }
            cell.bannerCell.image = UIImage(named: bannerList[indexPath.row])
            return cell
        }
        else if collectionView == self.storeCollectionView{
            /*
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoreCell.identifier, for: indexPath) as? StoreCell else {
                return UICollectionViewCell()
            }
            cell.setUserItemCell()
            return cell*/
            
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "storeCell", for: indexPath) as? StoreCell else {
                return UICollectionViewCell()
            }
            let restuarantInfo = restuarantViewModel.restuarantInfo(at: indexPath.item)
            //cell.delegate = self
            cell.updateUI(info: restuarantInfo)
            return cell
            
        }
        else{
            return UICollectionViewCell()
        }
        
    }
    
    
    //컬렉션뷰 사이즈 설정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == bannerCollectionView{
            return CGSize(width: self.bannerCollectionView.bounds.width, height: self.bannerCollectionView.bounds.height)
        }
        else if collectionView == storeCollectionView{
        
            let width: CGFloat = (collectionView.bounds.width - 8)/2
            let height: CGFloat = width * 51/40
            return CGSize(width: width, height: height)
 
        }
        else{
            return CGSize(width: 0, height: 0)
        }
    }
    
    
    //추가
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        if collectionView == self.storeCollectionView{
            return 0
        }else{
            return 0
        }
    }
    
    
    //배너 컬렉션뷰 감속 끝났을 때 현재 페이지 체크
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        self.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }

}


/*  //현재 사용 X
extension HomeViewController {
    
    func successDataReceived(_ result : HomeResult){
        //storeCollectionView.
        restaurantIdx = result.restaurantIdx
        name = result.name
        profImg = result.profImg
        rating = result.rating
        location = result.location
        views = result.views
        reviews = result.reviews
        self.viewDidAppear(false)
        self.storeCollectionView.reloadData()
    }
    
    func failureDataReceived(_ message : String){
        print("데이터 받기 실패 !!")
    }
}
*/


//
/*
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    //총 page 개수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(TestCell.self)", for: indexPath) as? TestCell else {
            fatalError("cell not")
        }
        
        cell.label.text = "\(indexPath.row)"
    
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int
    {
        1
    }
    
    //cell과 collectionview의 크기를 일치
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize.init(width: collectionView.bounds.width, height: collectionView.bounds.height)
    }
    
    //section 내부 cell간의 공간을 제거
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
    
    //section 사이의 공간을 제거
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
}

extension HomeViewController: UIScrollViewDelegate {
    
    //수동으로 넘을 때 page를 인식
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let x = scrollView.contentOffset.x
        let w = scrollView.bounds.size.width
        currentPage = Int(ceil(x/w))
        print(currentPage)
    }

}
*/
