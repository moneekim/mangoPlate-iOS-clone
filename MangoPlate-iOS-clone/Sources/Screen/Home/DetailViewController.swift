//
//  DetailViewController.swift
//  MangoPlate-iOS-clone
//
//  Created by 김모경 on 2021/08/25.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var pictureCollectionView: UICollectionView!
    
    var currentPage : Int = 0
    let pictureList : [String] = ["상세_사진예1", "상세_사진예2", "상세_사진예3", "상세_사진예4"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //상단 사진 모음
        pictureCollectionView.delegate = self
        pictureCollectionView.dataSource = self
        pictureCollectionView.register(UINib(nibName: "DetailPictureCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "detailPicture")
        bannerMove()

    }
    
    
    //배너 움직임 메소드
    func bannerMove() {
        //현재페이지가 마지막 페이지일 경우
        if self.currentPage == pictureList.count-1 {
            // 맨 처음 페이지로 돌아감
            pictureCollectionView.scrollToItem(at: NSIndexPath(item: 0, section: 0) as IndexPath, at: .right, animated: true)
            self.currentPage = 0
            return
        }
        
        //다음 페이지로 넘기기
        self.currentPage += 1
        pictureCollectionView.scrollToItem(at: NSIndexPath(item: currentPage, section: 0) as IndexPath, at: .right, animated: true)
    }
    

}

extension DetailViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    //컬렉션뷰 개수 설정
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == pictureCollectionView{
            return pictureList.count
        }
        else{
            return 0
        }
    }
    
    //컬렉션뷰 셀 설정
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        
        if collectionView == self.pictureCollectionView{
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "detailPicture", for: indexPath) as? DetailPictureCollectionViewCell else { return UICollectionViewCell() }
            cell.pictureCell.image = UIImage(named: pictureList[indexPath.row])
            return cell
        }
        else{
            return UICollectionViewCell()
        }
        
    }
    
    //컬렉션뷰 사이즈 설정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == pictureCollectionView{
            return CGSize(width: self.pictureCollectionView.bounds.width, height: self.pictureCollectionView.bounds.height)
        }
        else{
            return CGSize(width: 0, height: 0)
        }
    }
    
    
}
